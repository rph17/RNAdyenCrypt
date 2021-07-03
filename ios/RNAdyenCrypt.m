#import "RNAdyenCrypt.h"
@implementation RNAdyenCrypt

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

@end
@interface RCT_EXTERN_MODULE(AdyenCryptCard, NSObject)

 +(BOOL)requiresMainQueueSetup
 {
   return YES;
 }

 RCT_EXTERN_METHOD(encryptCard:(NSString) cardNumber
 expiryMonth:(NSString)expiryMonth
 expiryYear:(NSString) expiryYear
 securityCode:(NSString) securityCode
 publicKey:(NSString) publicKey
 resolver:(RCTPromiseResolveBlock)resolve
 rejecter:(RCTPromiseRejectBlock)reject)
@end

