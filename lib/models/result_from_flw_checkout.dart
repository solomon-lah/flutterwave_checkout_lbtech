// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Object returned when payment is successful
class ResultFromFlwCheckout {
  final String referenceNumber;
  final String status;
  ResultFromFlwCheckout({
    required this.referenceNumber,
    required this.status,
  });

  ResultFromFlwCheckout copyWith({
    String? referenceNumber,
    String? status,
  }) {
    return ResultFromFlwCheckout(
      referenceNumber: referenceNumber ?? this.referenceNumber,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'referenceNumber': referenceNumber,
      'completed': status,
    };
  }

  factory ResultFromFlwCheckout.fromMap(Map<String, dynamic> map) {
    return ResultFromFlwCheckout(
      referenceNumber: map['tx_ref'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFromFlwCheckout.fromJson(String source) =>
      ResultFromFlwCheckout.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResultFromFlwCheckout(referenceNumber: $referenceNumber, status: $status)';

  @override
  bool operator ==(covariant ResultFromFlwCheckout other) {
    if (identical(this, other)) return true;

    return other.referenceNumber == referenceNumber && other.status == status;
  }

  @override
  int get hashCode => referenceNumber.hashCode ^ status.hashCode;
}
