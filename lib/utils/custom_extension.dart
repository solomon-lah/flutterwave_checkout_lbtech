import 'package:intl/intl.dart';
/// custom extension for num data type
extension DigitExtension on num {
  /// converts number to thousand format with 2 dp e.g convert 1000 to 1,000.00 
  String toCurrencyFormat({bool isMorethan2 = false}) {
    final formatter =
        isMorethan2 ? NumberFormat("#,##0.000000") : NumberFormat("#,##0.00");
    return formatter.format(this);
  }
 /// converts number to thousand format e.g convert 1000 to 1,000
  String toThousandFormat() {
    final formatter = NumberFormat("#,##0");
    return formatter.format(this);
  }
}
