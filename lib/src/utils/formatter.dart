import 'package:flutter/services.dart';

class Formatter extends TextInputFormatter {
  const Formatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return TextEditingValue(text: text);
  }
}
