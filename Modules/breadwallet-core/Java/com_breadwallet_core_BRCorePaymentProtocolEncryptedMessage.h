/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage */

#ifndef _Included_com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
#define _Included_com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getMessage
 * Signature: ()[B
 */
JNIEXPORT jbyteArray JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getMessage
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getReceiverPublicKeyReference
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getReceiverPublicKeyReference
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getSenderPublicKeyReference
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getSenderPublicKeyReference
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getNonce
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getNonce
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getSignature
 * Signature: ()[B
 */
JNIEXPORT jbyteArray JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getSignature
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getIdentifier
 * Signature: ()[B
 */
JNIEXPORT jbyteArray JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getIdentifier
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getStatusCode
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getStatusCode
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    getStatusMessage
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_getStatusMessage
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    createPaymentProtocolEncryptedMessage
 * Signature: ([B)J
 */
JNIEXPORT jlong JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_createPaymentProtocolEncryptedMessage
  (JNIEnv *, jclass, jbyteArray);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    serialize
 * Signature: ()[B
 */
JNIEXPORT jbyteArray JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_serialize
  (JNIEnv *, jobject);

/*
 * Class:     com_breadwallet_core_BRCorePaymentProtocolEncryptedMessage
 * Method:    disposeNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_com_electraproject_core_BRCorePaymentProtocolEncryptedMessage_disposeNative
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
