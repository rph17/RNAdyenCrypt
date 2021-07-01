
#import "RNAdyenCrypt.h"
#import "AdyenCard/AdyenCard.h"

@implementation RNAdyenCrypt

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(encrypt:
                  (NSString *)holderName
                  number:(NSString *)number
                  cvc:(NSString *)cvc
                  expiryMonth:(NSString *)expiryMonth
                  expiryYear:(NSString *)expiryYear
                  publickey:(NSString *)publicKey
                  resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    
    
     @try {
//         CardNumberValidator *cardValidador = [CardNumberValidator new];
//         NSObject *cardValidator = ;
//         CardNumberValidator *card = [CardNumberValidator new];
//         card.generationtime = [NSDate new];
//         card.number = cardNumberCard;
//         card.holderName = cardHolderName;
//         card.cvc = cvc;
//         card.expiryMonth = expiryMonth;
//         card.expiryYear = expiryYear;
//
//         NSData *cardData = [card encode];
//         NSString *encryptedCard = [ADYEncrypter encrypt:cardData publicKeyInHex:publicKey];
//         resolve(encryptedCard);
     } @catch(NSException *exception) {
         NSError *error = nil;
         reject(@"adyen_error", @"failed to encrypt", error);
     }
//    let cardValidator = CardNumberValidator()
//        let isCardValid: Bool = cardValidator.isValid(cardNumberValue ?? "")
//        let expiryValidator = CardExpiryDateValidator()
//        let isExpiryValid: Bool = expiryValidator.isValid(expiryDate)
//        let securityCodeValidator = CardSecurityCodeValidator()
//        let isSecurityCodeValid = securityCodeValidator.isValid(securityCodeValue)
//        if isCardValid && isExpiryValid && isSecurityCodeValid && (cardHolderNameValue != nil){
//            let cardObject = CardEncryptor.Card(number: cardNumberValue, securityCode: securityCodeValue, expiryMonth: expiryMonthValue, expiryYear: expiryYearValue)
//            let encryptedCard = CardEncryptor.encryptedCard(for: cardObject, publicKey: self.PUBLIC_KEY)
//            makePayment(details: encryptedCard, holderName: cardHolderNameValue ?? "", type: "scheme")
//        }
}


@end
  
