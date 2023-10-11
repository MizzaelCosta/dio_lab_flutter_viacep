import 'package:dio_lab_flutter_viacep/src/pages/home/home_update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home/home_controller.dart';

class SearchCep extends StatelessWidget {
  const SearchCep({
    super.key,
  });

  final String empty = '';

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeController>();
    final update = context.read<HomeUpdate>();

    final homeUpdate = update.homeUpdate;
    final text = update.cepTextEditingController;

    return IconButton(
      icon: const Icon(
        Icons.search,
      ),
      onPressed: () async {
        homeUpdate(
          isLoading: true,
          text: text.text,
        );
        final response = await controller.getCep(text.text);
        homeUpdate(
          response: response,
          text: empty,
        );
      },
    );
  }
}
