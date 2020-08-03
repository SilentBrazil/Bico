import 'package:intl/intl.dart';

class Utils{
  static String moneyText(double value) {
    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");
    return formatter.format(value);
  }
}