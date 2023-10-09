import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  const EditText({
    super.key,
    required this.controller,
    this.label,
  });

  final TextEditingController controller;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
