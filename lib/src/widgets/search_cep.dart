import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home/home_controller.dart';

class SearchCep extends StatelessWidget {
  const SearchCep({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();

    return IconButton(
      icon: const Icon(
        Icons.search,
      ),
      onPressed: () async {
        homeController.getCep(
          homeController.strCep!.text,
        );
      },
    );
  }
}
