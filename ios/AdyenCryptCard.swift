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

@objc(AdyenCryptCard)
class AdyenCryptCard: RCTEventEmitter {
  var cardComponent: CardComponent?
  override func supportedEvents() -> [String]! {
    return [
      "onPaymentFail",
      "onPaymentProvide",
      "onPaymentSubmit",
    ]
  }
}
//CardComponentDelegate
extension AdyenCryptCard: CardComponentDelegate {
    func didChangeBIN(_ value: String, component: CardComponent) {
        
    }
    
    func didChangeCardType(_ value: [CardType]?, component: CardComponent) {
        
    }

   @objc func encryptCard(_ cardNumber: String,
                          expiryMonth:String,
                          expiryYear:String,
                          securityCode:String,
                          publicKey: String,
                          resolver resolve: RCTPromiseResolveBlock,
                          rejecter reject: RCTPromiseRejectBlock)  {
       let card = CardEncryptor.Card(number: cardNumber,
                                     securityCode: securityCode,
                                     expiryMonth:  expiryMonth,
                                     expiryYear: expiryYear)
    do {
        let encryptedCard = try CardEncryptor.encryptedCard(for: card, publicKey: publicKey)
         
         let resultMap:Dictionary? = [
           "encryptedCardNumber":encryptedCard.number,
           "encryptedExpiryMonth":encryptedCard.expiryMonth,
           "encryptedExpiryYear":encryptedCard.expiryYear,
           "encryptedSecurityCode":encryptedCard.securityCode,
         ]
         resolve(resultMap)
    } catch _ {
        print("Not me error")
    }
   }
}
