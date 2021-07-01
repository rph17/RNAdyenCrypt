
import { NativeModules } from 'react-native';

const { RNAdyenCrypt } = NativeModules;

export const AdyenCrypto = (card, publicKey) => {
    const {holderName, number, cvc, expiryMonth, expiryYear} = card
    return RNAdyenCrypt.encrypt(
        holderName,
        number,
        cvc,
        expiryMonth,
        expiryYear,
        publicKey,
      )
} 
