library flutterwave_checkout_lbtech;

import 'package:flutter/material.dart';
import 'package:flutterwave_checkout_lbtech/flw_checkout_screen.dart';
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';
import 'package:flutterwave_checkout_lbtech/models/result_from_flw_checkout.dart';

/// the package base class
class FlutterwaveChecoutLbtech {
  /// the method that performs payment
  static Future<ResultFromFlwCheckout?> checkout(
      {required FlwCheckoutRequest checkoutRequest,
      required BuildContext context}) async {
    final response = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return FlwCheckoutScreen(
          flwCheckoutRequest: checkoutRequest,
        );
      },
    ));
    final ResultFromFlwCheckout? dataReturned = response;
    return dataReturned;
  }
}
