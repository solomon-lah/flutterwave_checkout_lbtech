```dart
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';
import 'package:flutterwave_checkout_lbtech/flutterwave_checkout_lbtech.dart';
import 'package:flutterwave_checkout_lbtech/models/result_from_flw_checkout.dart';
void _processPayment() async {
    final FlwCheckoutRequest flwCheckoutRequest = FlwCheckoutRequest(
        redirectUrl: "https:/google.com",//replace with a valid url
        amount: 2000.50,
        email: "", //insert customer's name
        transactionRef: DateTime.now().millisecondsSinceEpoch.toString(),
        customerName: "Solomon Oluwafemi",
        currency: "NGN",
        onError: (message) {
          
        },
        //insert your public key 
        publicKey: "");
    final ResultFromFlwCheckout? resultFromFlwCheckout = await FlutterwaveChecoutLbtech.checkout(
            checkoutRequest: flwCheckoutRequest, context: context);
    
  }       
```