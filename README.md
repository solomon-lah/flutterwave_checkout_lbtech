

## Introduction
The Flutter package helps you create seamless payment experiences in your dart mobile app. It implements the [flutterwave html checkout](https://developer.flutterwave.com/docs/html-checkout) for payment collection.
Kindly note this a community package; [flutterwave_standard](https://pub.dev/packages/flutterwave_standard) is the official package developed by the flutter wave team. 
## Supported Platforms
- Android
- iOS

## Installation 
1.  Add the dependency to your project. In your pubspec.yaml file add: flutterwave_checkout_lbtech: latest
2.  Run flutter pub get


## Usage
Create an object of FlwCheckoutRequest. It parameters are as tabulated below:
| Parameter | Data type | Description|
| --- | --- | -- |
| redirectUrl | String | redirect_url form field |  
| amount | num | amount form field |
| email | String | customer email form field |
| transactionRef | String | tx_ref form field |
| customerName | String | customer name form field |
| currency | String | currency form field e.g NGN, USD etc check flutterwave documentation for possible value |
| publicKey | String | public_key form field |
| onError | void Function (String message)? | callback action if any http error is encountered |

```dart
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';
final FlwCheckoutRequest flwCheckoutRequest = FlwCheckoutRequest(
        redirectUrl: "https://mysite.com",// ensure it is a valid url 
        amount: 2000.50,
        email: "mail@gmail.com",
        transactionRef: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: "Solomon Oluwafemi",
        currency: "NGN",
        onError: (String message) {
          
        },
        publicKey: "FLWPUBK_TEST-gigiggjgjgjggjgjgvvnvn-X");
```
Call the static checkout method  of FlutterwaveChecoutLbtech class. It returns an object of the ResultFromFlwCheckout class if successful and null otherwise.
 It takes the parameter below:
- FlwCheckoutRequest 
- BuildContext.
```dart
import 'package:flutterwave_checkout_lbtech/flutterwave_checkout_lbtech.dart';
import 'package:flutterwave_checkout_lbtech/models/result_from_flw_checkout.dart';

final ResultFromFlwCheckout? resultFromFlwCheckout = await FlutterwaveChecoutLbtech.checkout(
            checkoutRequest: flwCheckoutRequest, context: context);
```
**ResultFromFlwCheckout**
| Parameter | Data type | Description|
| --- | --- | -- |
| referenceNumber | String | transaction reference number |  
| status | String | transaction status |

## Key Note
As advised by the flutterwave team, kindly verify the status of any payment using their verify transaction endpoint. Click [here](https://developer.flutterwave.com/reference/verify-transaction-with-tx_ref) for more info.
## Built using
- [flutter_inappwebview: ^6.1.5](https://pub.dev/packages/flutter_inappwebview) 
- [intl:^0.20.2](https://pub.dev/packages/intl)

## Flutterwave API References
- [Flutterwave API Doc](https://developer.flutterwave.com/docs)
- [Flutterwave Inline Payment Doc](https://developer.flutterwave.com/docs/flutterwave-inline)
- [Flutterwave Dashboard](https://dashboard.flutterwave.com/login)

## Author contact
For issues or suggestions kindly send a mail to solotechblast@gmail.com