#import "RNAdyenCrypt.h"
@implementation RNAdyenCrypt

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

@interface RCT_EXTERN_MODULE(AdyenCryptCard, NSObject)

+(BOOL)requiresMainQueueSetup
{
  return YES;
}
//init payment config
RCT_EXTERN_METHOD(configPayment:(NSString)publicKey env:(NSString *) env)
printl("InicioClasssss")
//
////RCT_EXTERN_METHOD(handleThreeDS2ChallengeAction:(NSString)actionJson)
RCT_EXTERN_METHOD(encryptCard:(NSString) cardNumber
expiryMonth:(NSInteger)expiryMonth
expiryYear:(NSInteger) expiryYear
securityCode:(NSString) securityCode
resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
@end
