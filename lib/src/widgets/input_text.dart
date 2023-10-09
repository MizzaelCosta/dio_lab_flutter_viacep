import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:dio_lab_flutter_viacep/src/utils/formatter.dart';
import 'package:dio_lab_flutter_viacep/src/utils/validator.dart';
import 'package:flutter/material.dart';

import '../models/cep.dart';
import 'search_cep.dart';

typedef UpdateFunction = void Function(bool loading,
    {Cep? response, required String text});

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.editingController,
    required this.update,
    required this.homeController,
    this.validator,
    this.formatter,
    this.label,
  });

  final TextEditingController editingController;
  final UpdateFunction update;
  final HomeController homeController;
  final List<Formatter>? formatter;
  final StringFunctionCallback validator;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: editingController,
      validator: validator,
      inputFormatters: formatter,
      decoration: InputDecoration(
        hintText: label,
        suffixIcon: SearchCep(
          update: update,
          cep: editingController,
          controller: homeController,
        ),
      ),
    );
  }
}
