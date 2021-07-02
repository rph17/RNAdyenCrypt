#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(AdyenDropInPayment, NSObject)

+(BOOL)requiresMainQueueSetup
{
  return YES;
}
//init payment config
RCT_EXTERN_METHOD(configPayment:(NSString)publicKey env:(NSString *) env)

//RCT_EXTERN_METHOD(handleThreeDS2ChallengeAction:(NSString)actionJson)
RCT_EXTERN_METHOD(encryptCard:(NSString) cardNumber expiryMonth:(NSInteger)expiryMonth expiryYear:(NSInteger) expiryYear securityCode:(NSString) securityCode resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject)
@end
