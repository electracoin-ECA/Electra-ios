//
//  TxAddressCell.swift
//  electraWallet
//
//  Created by CaribouECA on 2020-02-2011.
//  Copyright © 2020 The Electra Foundation. All rights reserved.
//

import UIKit

class TxAddressExplorerCell: TxDetailRowCell
{
    
    // MARK: Views
    
    internal let addressButton = UIButton(type: .system)
    
    // MARK: - Init
    
    override func addSubviews() {
        super.addSubviews()
        container.addSubview(addressButton)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        addressButton.constrain([
            addressButton.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: C.padding[1]),
            addressButton.constraint(.trailing, toView: container),
            
            addressButton.constraint(.top, toView: container),
            addressButton.constraint(.bottom, toView: container)
            ])
    }
    
    override func setupStyle() {
        super.setupStyle()
        addressButton.titleLabel?.font = .customBody(size: 14.0)
        addressButton.titleLabel?.adjustsFontSizeToFitWidth = true
        addressButton.titleLabel?.minimumScaleFactor = 0.7
        addressButton.titleLabel?.lineBreakMode = .byTruncatingMiddle
        addressButton.titleLabel?.textAlignment = .right
        addressButton.tintColor = .darkGray
        
        addTapAction()
    }
    
    func addTapAction()
    {
        addressButton.tap = strongify(self) { myself in
            myself.addressButton.tempDisable()
            Store.trigger(name: .lightWeightAlert(S.Receive.copied))
            UIPasteboard.general.string = myself.addressButton.titleLabel?.text
        }
    }
    
    func set(address: String) {
        addressButton.setTitle(address, for: .normal)
    }
}
