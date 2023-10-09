import 'package:flutter/material.dart';

import '../pages/home/home_controller.dart';
import 'input_text.dart';

class SearchCep extends StatelessWidget {
  const SearchCep({
    super.key,
    required this.update,
    required this.cep,
    required this.controller,
    required this.empty,
  });

  final UpdateFunction update;
  final TextEditingController cep;
  final HomeController controller;
  final String empty;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
