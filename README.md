
# react-native-adyen-crypt

## Getting started

`$ npm install react-native-adyen-crypt --save`

### Mostly automatic installation

`$ react-native link react-native-adyen-crypt`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-adyen-crypt` and add `RNAdyenCrypt.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNAdyenCrypt.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import br.com.rnadyencrypt.RNAdyenCryptPackage;` to the imports at the top of the file
  - Add `new RNAdyenCryptPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-adyen-crypt'
  	project(':react-native-adyen-crypt').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-adyen-crypt/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-adyen-crypt')
  	```


## Usage
```javascript
import {AdyenCrypto} from 'react-native-adyen-crypt';

// TODO: What to do with the module?
testeCrypto = async () => {
    const publicKey = '10001|...';
    const card = {
        holderName: 'John Doe',
        number: '4111111111111111',
        cvc: '737',
        expiryMonth: '03',
        expiryYear: '2030',
      }
      const token = await AdyenCrypto(card, publicKey);
      console.log(token);
}

Results:

{
    "encryptedExpiryYear": "adyenan0_1_1$iDNIHJMf1/kGBSh1Bjh7...",
    "encryptedSecurityCode": "adyenan0_1_1$KWs9XGstlNtsfJG7mm...",
    "encryptedExpiryMonth": "adyenan0_1_1$BWEOk1ItMxmiuaP6R6n...",
    "encryptedCardNumber": "adyenan0_1_1$S0/6rb3Isq7v5DE0bgT3..."
}
```
  