import 'package:intl/intl.dart';

extension DigitExtension on num {
  String toCurrencyFormat({bool isMorethan2 = false}) {
    final formatter =
        isMorethan2 ? NumberFormat("#,##0.000000") : NumberFormat("#,##0.00");
    return formatter.format(this);
  }

  String toThousandFormat() {
    final formatter = NumberFormat("#,##0");
    return formatter.format(this);
  }
}
