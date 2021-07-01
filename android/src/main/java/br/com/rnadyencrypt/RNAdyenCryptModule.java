
package br.com.rnadyencrypt;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNAdyenCryptModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNAdyenCryptModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNAdyenCrypt";
  }
}