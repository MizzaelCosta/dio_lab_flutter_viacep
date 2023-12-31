import 'package:flutter/material.dart';

class SearchCep extends StatelessWidget {
  const SearchCep(
    this.onPressed, {
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.search,
      ),
      onPressed: onPressed,
    );
  }
}
