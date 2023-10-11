import 'package:dio_lab_flutter_viacep/src/utils/formatter.dart';
import 'package:dio_lab_flutter_viacep/src/utils/validator.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.validator,
    this.formatter,
    this.label,
    this.sufixIcon,
    this.controller,
    this.centerAlign = false,
  });

  final List<Formatter>? formatter;
  final StringFunctionCallback validator;
  final TextEditingController? controller;
  final String? label;
  final Widget? sufixIcon;
  final bool centerAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: (centerAlign) ? TextAlign.center : TextAlign.start,
      controller: controller,
      validator: validator,
      inputFormatters: formatter,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: sufixIcon,
      ),
    );
  }
}
