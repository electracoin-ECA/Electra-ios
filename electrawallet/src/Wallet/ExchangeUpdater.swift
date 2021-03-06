//
//  ExchangeUpdater.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2017-01-27.
//  Copyright © 2017 breadwallet LLC. All rights reserved.
//

import Foundation

class ExchangeUpdater: Subscriber {

    let currencies: [Currency]
    var lastUpdate = Date.distantPast
    let requestThrottleSeconds: TimeInterval = 5.0
    
    // MARK: - Public
    init(currencies: [Currency]) {
        self.currencies = currencies
        currencies.forEach { currency in
            Store.subscribe(self,
                            selector: { $0.defaultCurrencyCode != $1.defaultCurrencyCode },
                            callback: { state in
                                guard let currentRate = state[currency]!.rates.first( where: { $0.code == state.defaultCurrencyCode }) else { return }
                                Store.perform(action: WalletChange(currency).setExchangeRate(currentRate))
            })
        }
    }

    func refresh(completion: @escaping () -> Void) {
        guard Date().timeIntervalSince(lastUpdate) > requestThrottleSeconds else { return }
        lastUpdate = Date()
        
        // get btc/fiat rates
        Backend.apiClient.exchangeRates(currencyCode: Currencies.btc.code) { [weak self] result in
            guard let `self` = self,
                case .success(let btcFiatRates) = result else { return }
            
            Store.perform(action: WalletChange(Currencies.btc).setExchangeRates(currentRate: self.findCurrentRate(rates: btcFiatRates), rates: btcFiatRates))
            
            // get eca/btc rates
            Backend.apiClient.ecaExchangeRates() { [weak self] result in
                guard let `self` = self,
                    case .success(let tokenBtcRates) = result else { return }

                // calculate token/fiat rates
                var tokenBtcDict = [String: Double]()
                tokenBtcRates.forEach { tokenBtcDict[$0.reciprocalCode] = $0.rate }
                
                Store.state.currencies.forEach { currency in
                    var tokenBtcRate = tokenBtcDict[currency.code.lowercased()]
                    
                    if let tokenBtcRate = tokenBtcRate {
                        let fiatRates: [Rate] = btcFiatRates.map { btcFiatRate in
                            let tokenFiatRate = btcFiatRate.rate * tokenBtcRate
                            return Rate(code: btcFiatRate.code, name: btcFiatRate.name, rate: tokenFiatRate, reciprocalCode: "btc")
                        }
                        Store.perform(action: WalletChange(currency).setExchangeRates(currentRate: self.findCurrentRate(rates: fiatRates), rates: fiatRates))
                    } else {
                        assert(false, "missing exchange rate")
                        print("ERROR: missing exchange rate for \(currency.code)")
                    }
                }
            }
        }
    }

    private func findCurrentRate(rates: [Rate]) -> Rate {
        guard let currentRate = rates.first( where: { $0.code == Store.state.defaultCurrencyCode }) else {
            Store.perform(action: DefaultCurrency.SetDefault(C.usdCurrencyCode))
            return rates.first( where: { $0.code == C.usdCurrencyCode })!
        }
        return currentRate
    }
}
