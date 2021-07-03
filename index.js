
import { NativeModules } from 'react-native';

const { AdyenCryptCard } = NativeModules;

export const AdyenCrypto = (card, publicKey) => {
    const {number, cvc, expiryMonth, expiryYear} = card
    return AdyenCryptCard.encryptCard(
        number,
        expiryMonth,
        expiryYear,
        cvc,
        publicKey,
      )
} 
