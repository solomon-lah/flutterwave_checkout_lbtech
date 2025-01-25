// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResultFromFlwCheckout {
  final String referenceNumber;
  final bool completed;
  ResultFromFlwCheckout({
    required this.referenceNumber,
    required this.completed,
  });

  ResultFromFlwCheckout copyWith({
    String? referenceNumber,
    bool? completed,
  }) {
    return ResultFromFlwCheckout(
      referenceNumber: referenceNumber ?? this.referenceNumber,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'referenceNumber': referenceNumber,
      'completed': completed,
    };
  }

  factory ResultFromFlwCheckout.fromMap(Map<String, dynamic> map) {
    return ResultFromFlwCheckout(
      referenceNumber: map['referenceNumber'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultFromFlwCheckout.fromJson(String source) =>
      ResultFromFlwCheckout.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResultFromFlwCheckout(referenceNumber: $referenceNumber, completed: $completed)';

  @override
  bool operator ==(covariant ResultFromFlwCheckout other) {
    if (identical(this, other)) return true;

    return other.referenceNumber == referenceNumber &&
        other.completed == completed;
  }

  @override
  int get hashCode => referenceNumber.hashCode ^ completed.hashCode;
}
