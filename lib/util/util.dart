import 'package:intl/intl.dart';

class Util {

  static String numberFormat(dynamic number) {
    var f = NumberFormat('###,###,###,###');
    if (!(number is int)) {
      return f.format(int.parse(number));
    } else {
      return f.format(number);
    }
  }

}