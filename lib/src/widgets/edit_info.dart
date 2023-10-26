import 'package:flutter/material.dart';

import '../pages/listed/listed_controller.dart';
import 'input_text.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({
    super.key,
    required this.index,
    required this.listedController,
  });

  final int index;
  final ListedController listedController;

  @override
  Widget build(BuildContext context) {
    final logradouro = TextEditingController();
    final complemento = TextEditingController();

    logradouro.text = listedController.cepList[index].logradouro;
    complemento.text = listedController.cepList[index].complemento;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Editar Cep'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                child: Column(
                  children: [
                    InputText(
                      controller: logradouro,
                      label: 'Logradouro',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputText(
                      controller: complemento,
                      label: 'Complemento',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        listedController.updateCep(
                            listedController.cepList[index].cep
                                .replaceAll('-', ''),
                            listedController.cepList[index]
                                .copyWith(
                                    logradouro: logradouro.text,
                                    complemento: complemento.text)
                                .toMap());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Editar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
