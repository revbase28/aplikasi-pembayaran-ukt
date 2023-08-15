import 'package:intl/intl.dart';

class Util {
  static String formatToIdr(int value){
    final format =  NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return format.format(value);
  }

  static String formatDate(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    return DateFormat("d MMMM yyyy", "id_ID").format(parsedDate);
  }
}