// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Object for making request
class FlwCheckoutRequest {
  final String redirectUrl;
  final num amount;
  final String email;
  final String transactionRef;
  final String customerName;
  final String currency;
  final String publicKey;
  // final void Function(Map<String, dynamic> data)? onSuccess;
  final void Function(String message)? onError;
  FlwCheckoutRequest({
    required this.redirectUrl,
    required this.amount,
    required this.email,
    required this.transactionRef,
    required this.customerName,
    required this.currency,
    required this.publicKey,
    // this.onSuccess,
    this.onError,
  });
}
