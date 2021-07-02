//
//  AdyenCryptCard.swift
//  RNAdyenCrypt
//
//  Created by Raphael on 01/07/2021.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Adyen
import Foundation
import SafariServices

@objc(AdyenDropInPayment)
class AdyenCryptCard: RCTEventEmitter {
  func dispatch(_ closure: @escaping () -> Void) {
    if Thread.isMainThread {
      closure()
    } else {
      DispatchQueue.main.async(execute: closure)
    }
  }

  func requiresMainQueueSetup() -> Bool {
    return true
  }
  var customCardComponent:CustomCardComponent?
  var dropInComponent: DropInComponent?
  var cardComponent: CardComponent?
  var threeDS2Component: ThreeDS2Component?
  var publicKey: String?
  var env: Environment?
  var isDropIn:Bool?
  var envName: String?
  var configuration: DropInComponent.PaymentMethodsConfiguration?
  override func supportedEvents() -> [String]! {
    return [
      "onPaymentFail",
      "onPaymentProvide",
      "onPaymentSubmit",
    ]
  }
}

extension AdyenCryptCard: DropInComponentDelegate {
  @objc func configPayment(_ publicKey: String, env: String) {
    configuration = DropInComponent.PaymentMethodsConfiguration()
    configuration?.card.publicKey = publicKey
    self.publicKey = publicKey
    configuration?.card.showsStorePaymentMethodField = false
    envName = env
    switch env {
    case "live":
      self.env = .live
    default:
      self.env = .test
    }
  }
   @objc func encryptCard(_ cardNumber: String,expiryMonth:Int, expiryYear:Int,securityCode:String,resolver resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock)  {
       let card = CardEncryptor.Card(number: cardNumber,
                                     securityCode: securityCode,
                                     expiryMonth:  String(expiryMonth),
                                     expiryYear: "20" + String(expiryYear))
     let encryptedCard = CardEncryptor.encryptedCard(for: card, publicKey: self.publicKey!)
     
     let resultMap:Dictionary? = [
       "encryptedNumber":encryptedCard.number,
       "encryptedExpiryMonth":encryptedCard.expiryMonth,
       "encryptedExpiryYear":encryptedCard.expiryYear,
       "encryptedSecurityCode":encryptedCard.securityCode,
     ]
     resolve(resultMap)
   }
}
