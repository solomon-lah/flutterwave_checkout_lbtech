```dart
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';
import 'package:flutterwave_checkout_lbtech/flutterwave_checkout_lbtech.dart';
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

await FlutterwaveChecoutLbtech.checkout(
            checkoutRequest: flwCheckoutRequest, context: context);        
```