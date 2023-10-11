import 'package:dio_lab_flutter_viacep/src/pages/listed/listed_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/listed_card.dart';

class ListedPage extends StatefulWidget {
  const ListedPage({super.key});

  @override
  State<ListedPage> createState() => _ListedPageState();
}

class _ListedPageState extends State<ListedPage> {
  late final ListedController listedController;

  @override
  void initState() {
    super.initState();
    listedController = context.read<ListedController>();
    listedController.listedUpdate = () {
      listedUpdate();
    };
    listedUpdate();
  }

  void listedUpdate() async {
    await listedController.getAllCep();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cep\'s salvos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: listedController.cepList.length,
          itemBuilder: (context, index) {
            return ListedCard(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
