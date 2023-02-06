import 'package:intl/intl.dart';

class Parser {


  RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);

  String textParser(String text) => text.replaceAll(exp, '');

  String rupiahFormatter(dynamic val) {

    int num = int.parse(val);

    NumberFormat formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    formatter.format(num);

    return formatter.format(num);
    
  }


}