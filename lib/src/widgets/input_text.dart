import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

import '../models/cep.dart';

typedef UpdateFunction = void Function(bool loading,
    {Cep? response, required String text});

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.cep,
    required this.update,
    required this.controller,
  });

  final TextEditingController cep;
  final UpdateFunction update;
  final HomeController controller;
  final String empty = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //TODO implementar formaters/ validators
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: cep,
      decoration: InputDecoration(
          suffixIcon: IconButton(
        icon: const Icon(
          Icons.search,
        ),
        onPressed: () async {
          update(true, text: cep.text);
          final response = await controller.getCep(cep.text);
          update(
            false,
            response: response,
            text: empty,
          );
        },
      )),
    );
  }
}
