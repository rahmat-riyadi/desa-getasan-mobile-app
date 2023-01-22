class Parser {


  RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);

  String textParser(String text) => text.replaceAll(exp, '');


}