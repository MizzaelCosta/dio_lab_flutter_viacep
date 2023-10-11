import 'package:dio_lab_flutter_viacep/src/pages/listed/listed_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'input_text.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final logradouro = TextEditingController();
    final complemento = TextEditingController();
    final controller = context.read<ListedController>();

    logradouro.text = controller.cepList[index].logradouro;
    complemento.text = controller.cepList[index].complemento;

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
                        controller.updateCep(
                            controller.cepList[index].cep.replaceAll('-', ''),
                            controller.cepList[index]
                                .copyWith(
                                    logradouro: logradouro.text,
                                    complemento: complemento.text)
                                .toMap());
                        controller.listedUpdate();
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
