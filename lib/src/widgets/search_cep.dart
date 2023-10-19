import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class SearchCep extends StatelessWidget {
  const SearchCep(
    this.homeController, {
    super.key,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search,
      ),
      onPressed: () async {
        homeController.getCep.call();
      },
    );
  }
}
