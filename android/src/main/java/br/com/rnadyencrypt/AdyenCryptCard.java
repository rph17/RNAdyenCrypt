package br.com.rnadyencrypt;

import android.app.Activity;
import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.Observer;
import com.adyen.checkout.card.CardComponent;
import com.adyen.checkout.card.CardConfiguration;
import com.adyen.checkout.core.api.Environment;
import com.adyen.checkout.cse.Card;
import com.adyen.checkout.cse.EncryptedCard;
import com.adyen.checkout.cse.Encryptor;
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
    @NonNull
    @Override
    public String getName() {
        return AdyenCryptCard.class.getSimpleName();
    }

    CardConfiguration cardConfiguration;
    public static AdyenCryptCard INSTANCE = null;


    public AdyenCryptCard(@NonNull ReactApplicationContext reactContext) {
        super(reactContext);
        AdyenCryptCard.INSTANCE = this;
    }

    @ReactMethod
    public void encryptCard(String cardNumber, String expiryMonth, String expiryYear, String securityCode, String publicKey, final Promise promise) {
        Card.Builder cardBuilder = new Card.Builder();
        int month = Integer.parseInt(expiryMonth);
        int year = Integer.parseInt(expiryYear);
        cardBuilder.setNumber(cardNumber).setExpiryDate(month, year);
        cardBuilder.setSecurityCode(securityCode);
        Card card = cardBuilder.build();
        final EncryptedCard encryptedCard = Encryptor.INSTANCE.encryptFields(card, publicKey);
        WritableMap resultMap = new WritableNativeMap();
        resultMap.putString("encryptedCardNumber", encryptedCard.getEncryptedNumber());
        resultMap.putString("encryptedExpiryMonth", encryptedCard.getEncryptedExpiryMonth());
        resultMap.putString("encryptedExpiryYear", encryptedCard.getEncryptedExpiryYear());
        resultMap.putString("encryptedSecurityCode", encryptedCard.getEncryptedSecurityCode());
        promise.resolve(resultMap);
    }
}