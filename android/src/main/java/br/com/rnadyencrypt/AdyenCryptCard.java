package com.reactnative.adyendropin;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.Observer;

// import com.adyen.checkout.adyen3ds2.Adyen3DS2Component;
// import com.adyen.checkout.base.ActionComponentData;
// import com.adyen.checkout.base.ComponentError;
// import com.adyen.checkout.base.PaymentComponentState;
// import com.adyen.checkout.base.component.BaseActionComponent;
// import com.adyen.checkout.base.model.PaymentMethodsApiResponse;
// import com.adyen.checkout.base.model.paymentmethods.PaymentMethod;
// import com.adyen.checkout.base.model.paymentmethods.RecurringDetail;
// import com.adyen.checkout.base.model.payments.request.PaymentMethodDetails;
// import com.adyen.checkout.base.model.payments.response.Action;
// import com.adyen.checkout.base.model.payments.response.QrCodeAction;
// import com.adyen.checkout.base.model.payments.response.RedirectAction;
// import com.adyen.checkout.base.model.payments.response.Threeds2ChallengeAction;
// import com.adyen.checkout.base.model.payments.response.Threeds2FingerprintAction;
// import com.adyen.checkout.base.model.payments.response.VoucherAction;
import com.adyen.checkout.card.CardComponent;
import com.adyen.checkout.card.CardConfiguration;
import com.adyen.checkout.core.api.Environment;
import com.adyen.checkout.cse.Card;
import com.adyen.checkout.cse.EncryptedCard;
import com.adyen.checkout.cse.Encryptor;
// import com.adyen.checkout.dropin.DropIn;
// import com.adyen.checkout.dropin.DropInConfiguration;
// import com.adyen.checkout.dropin.service.CallResult;
// import com.adyen.checkout.redirect.RedirectComponent;
// import com.adyen.checkout.redirect.RedirectUtil;
import com.facebook.react.bridge.*;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import android.net.Uri;
import android.util.Log;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class AdyenCryptCard extends ReactContextBaseJavaModule {
    CardConfiguration cardConfiguration;
    // DropInConfiguration dropInConfiguration;
    // RedirectComponent redirectComponent;
    // Adyen3DS2Component adyen3DS2Component;
    // String publicKey;
    // Environment environment;
    // String envName;
    // boolean isDropIn;
    // static Map<String, BaseActionComponent> ACTION_COMPONENT_MAP = new ConcurrentHashMap<>();
    public static AdyenDropInPaymentService dropInService;
    public static AdyenDropInPayment INSTANCE = null;


    public AdyenCryptCard(@NonNull ReactApplicationContext reactContext) {
        super(reactContext);
        AdyenDropInPayment.INSTANCE = this;
    }

    // public static WritableMap convertJsonToMap(JSONObject jsonObject) throws JSONException {
    //     WritableMap map = new WritableNativeMap();

    //     Iterator<String> iterator = jsonObject.keys();
    //     while (iterator.hasNext()) {
    //         String key = iterator.next();
    //         Object value = jsonObject.get(key);
    //         if (value instanceof JSONObject) {
    //             map.putMap(key, convertJsonToMap((JSONObject) value));
    //         } else if (value instanceof JSONArray) {
    //             map.putArray(key, convertJsonToArray((JSONArray) value));
    //         } else if (value instanceof Boolean) {
    //             map.putBoolean(key, (Boolean) value);
    //         } else if (value instanceof Integer) {
    //             map.putInt(key, (Integer) value);
    //         } else if (value instanceof Double) {
    //             map.putDouble(key, (Double) value);
    //         } else if (value instanceof String) {
    //             map.putString(key, (String) value);
    //         } else {
    //             map.putString(key, value.toString());
    //         }
    //     }
    //     return map;
    // }

    // public static WritableArray convertJsonToArray(JSONArray array) throws JSONException {
    //     WritableNativeArray result = new WritableNativeArray();
    //     for (int i = 0; i < array.length(); i++) {
    //         Object value = array.get(i);
    //         if (value instanceof JSONObject) {
    //             result.pushMap(convertJsonToMap((JSONObject) value));
    //         } else if (value instanceof JSONArray) {
    //             result.pushArray(convertJsonToArray((JSONArray) value));
    //         } else if (value instanceof Boolean) {
    //             result.pushBoolean((Boolean) value);
    //         } else if (value instanceof Integer) {
    //             result.pushInt((Integer) value);
    //         } else if (value instanceof Double) {
    //             result.pushDouble((Double) value);
    //         } else if (value instanceof String) {
    //             result.pushString((String) value);
    //         } else {
    //             result.pushString(value.toString());
    //         }
    //     }

    //     return result;

    // }

    @ReactMethod
    public void encryptCard(String cardNumber, Integer expiryMonth, Integer expiryYear, String securityCode, String publicKey, final Promise promise) {
        Card.Builder cardBuilder = new Card.Builder();
        cardBuilder.setNumber(cardNumber).setExpiryDate(expiryMonth, expiryYear);
        cardBuilder.setSecurityCode(securityCode);
        Card card = cardBuilder.build();
        final EncryptedCard encryptedCard = Encryptor.INSTANCE.encryptFields(card, publicKey);
        WritableMap resultMap = new WritableNativeMap();
        resultMap.putString("encryptedNumber", encryptedCard.getEncryptedNumber());
        resultMap.putString("encryptedExpiryMonth", encryptedCard.getEncryptedExpiryMonth());
        resultMap.putString("encryptedExpiryYear", encryptedCard.getEncryptedExpiryYear());
        resultMap.putString("encryptedSecurityCode", "20" + encryptedCard.getEncryptedSecurityCode());
        promise.resolve(resultMap);
    }
}