

## Introduction
The Flutter package helps you create seamless payment experiences in your dart mobile app. It implements the [flutterwave html checkout](https://developer.flutterwave.com/docs/html-checkout) for payment collection.
Kindly note this a community package. [flutterwave_standard](https://pub.dev/packages/flutterwave_standard) is the official package developed by the flutter wave team. 
Motivation behind this project is because of the analysis issues I encountered with the official **flutter_standard** package as it does not support some latest dependencies used by my project.
## Supported Platforms
- Android
- iOS

## Installation 
1.  Add the dependency to your project. In your pubspec.yaml file add: flutterwave_checkout_lbtech: 0.0.1
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
| onSuccess | void Function (Map<String, String> data)? | callback action on payment success or user cancel payment. It returns a Map Object as defined by the flutterwave documentation |
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
        onSuccess: (data) {},
        onError: (message) {
          
        },
        publicKey: "FLWPUBK_TEST-gigiggjgjgjggjgjgvvnvn-X");
```
Call the static checkout method  of FlutterwaveChecoutLbtech class. It takes the parameter below:
- FlwCheckoutRequest 
- BuildContext.
```dart
import 'package:flutterwave_checkout_lbtech/flutterwave_checkout_lbtech.dart';
await FlutterwaveChecoutLbtech.checkout(
            checkoutRequest: flwCheckoutRequest, context: context);
```


## Built using
- [flutter_inappwebview: ^6.1.5](https://pub.dev/packages/flutter_inappwebview) 
- [intl:^0.20.2](https://pub.dev/packages/intl)

## Flutterwave API References
- [Flutterwave API Doc](https://developer.flutterwave.com/docs)
- [Flutterwave Inline Payment Doc](https://developer.flutterwave.com/docs/flutterwave-inline)
- [Flutterwave Dashboard](https://dashboard.flutterwave.com/login)

## Author contact
For issues or suggestions kindly send a mail to solotechblast@gmail.com