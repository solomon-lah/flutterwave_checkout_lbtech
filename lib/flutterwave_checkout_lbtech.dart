library flutterwave_checkout_lbtech;

import 'package:flutter/material.dart';
import 'package:flutterwave_checkout_lbtech/flw_checkout_screen.dart';
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';

/// the package base class
class FlutterwaveChecoutLbtech {
  /// the method that performs payment
  static Future<Map<String, String>> checkout(
      {required FlwCheckoutRequest checkoutRequest,
      required BuildContext context}) async {
    final response = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return FlwCheckoutScreen(
          flwCheckoutRequest: checkoutRequest,
        );
      },
    ));
    final Map<String, String> dataReturned = response as Map<String, String>;
    return dataReturned;
  }
}
