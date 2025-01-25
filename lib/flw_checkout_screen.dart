import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterwave_checkout_lbtech/models/flw_checkout_request.dart';
import 'package:flutterwave_checkout_lbtech/utils/custom_extension.dart';

class FlwCheckoutScreen extends StatefulWidget {
  final FlwCheckoutRequest flwCheckoutRequest;
  const FlwCheckoutScreen({required this.flwCheckoutRequest, super.key});

  @override
  State<FlwCheckoutScreen> createState() => _FlwCheckoutScreenState();
}

class _FlwCheckoutScreenState extends State<FlwCheckoutScreen> {
  // late InAppWebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: InAppWebView(
            initialData: InAppWebViewInitialData(data: '''
            <!DOCTYPE html>
              <html>
                  <head>
                      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.5.3/css/bootstrap.min.css" integrity="sha512-oc9+XSs1H243/FRN9Rw62Fn8EtxjEYWHXRvjS43YtueEewbS6ObfXcJNyohjHqVKFPoXXUxwc+q1K7Dee6vv9g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
                  </head>
                  <body>
                      <div class="d-flex justify-content-center" style="margin-top:500px;font-size:2rem">
                      <form method="POST" action="https://checkout.flutterwave.com/v3/hosted/pay">
                    <p class="justify-content-center">You are about to make a payment of ${widget.flwCheckoutRequest.amount.toCurrencyFormat()}</p>
                    <p class="justify-content-center">Click the button below to continue</p>
                          <input type="hidden" name="public_key" value="${widget.flwCheckoutRequest.publicKey}" />
                          <input type="hidden" name="tx_ref" value="${widget.flwCheckoutRequest.transactionRef}" />
                          <input type="hidden" name="amount" value="${widget.flwCheckoutRequest.amount}" />
                          <input type="hidden" name="currency" value="${widget.flwCheckoutRequest.currency}" />
                          <input
                              type="hidden"
                              name="redirect_url"
                              value="${widget.flwCheckoutRequest.redirectUrl}"
                          />
                          <input type="hidden" name="meta[token]" value="54" />
                          <input type="hidden" name="customer[name]" value="${widget.flwCheckoutRequest.customerName}" />
                          <input
                              type="hidden"
                              name="customer[email]"
                              value="${widget.flwCheckoutRequest.email}"
                          />
                          <div class="d-flex justify-content-center "><button type="submit" class="btn-success btn-lg p-4" style="font-size:2rem">Pay Now</button></div>
                          <div class="d-flex justify-content-center mt-1"><a href="${widget.flwCheckoutRequest.redirectUrl}?tx_ref=${widget.flwCheckoutRequest.transactionRef}&status=cancel"><button type="button" class="btn-danger btn-lg p-4" style="font-size:2rem">Cancel</button></div>
                      </form>
                      </div>
                  </body>
                  
              </html>
            '''),
            onWebViewCreated: (controller) {
              // _controller = controller;
            },
            onLoadStart: (controller, url) {
              if (url == null) {
                return;
              }
              if (url.origin.toLowerCase().contains(
                  widget.flwCheckoutRequest.redirectUrl.toLowerCase())) {
                final Map<String, String> queryParameters = url.queryParameters;

                if (widget.flwCheckoutRequest.onSuccess != null) {
                  widget.flwCheckoutRequest.onSuccess!(queryParameters);
                }
                // showToast(status);
                Navigator.pop(context, queryParameters);
              }
            },
            onLoadStop: (controller, url) {},
            onReceivedHttpError: (controller, url, statusCode) {
              if (widget.flwCheckoutRequest.onError != null) {
                widget.flwCheckoutRequest
                    .onError!(statusCode.statusCode.toString());
              }
              Navigator.pop(context);
            },
            onReceivedError: (controller, url, code) {
              if (widget.flwCheckoutRequest.onError != null) {
                widget.flwCheckoutRequest.onError!(code.description);
              }
              Navigator.pop(context);
            },
            onProgressChanged: (controller, progress) {},
            initialSettings: InAppWebViewSettings(
                cacheMode: CacheMode.LOAD_NO_CACHE, clearSessionCache: true),
          ),
        ),
      ),
    );
  }

  // void _showScaffoldMessage({required String message}) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }
}
