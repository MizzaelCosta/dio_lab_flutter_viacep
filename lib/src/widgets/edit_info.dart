import 'package:dio_lab_flutter_viacep/src/pages/listed/listed_controller.dart';
import 'package:flutter/material.dart';

import 'edit_text.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({
    super.key,
    required this.index,
    required this.controller,
    required this.update,
  });

  final int index;
  final ListedController controller;
  final Function update;

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final logradouro = TextEditingController();
  final complemento = TextEditingController();

  @override
  void initState() {
    super.initState();
    logradouro.text = widget.controller.cepList[widget.index].logradouro;
    complemento.text = widget.controller.cepList[widget.index].complemento;
  }

  @override
  void dispose() {
    logradouro.dispose();
    complemento.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    EditText(
                      controller: logradouro,
                      label: 'Logradouro',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    EditText(
                      controller: complemento,
                      label: 'Complemento',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.controller.updateCep(
                            widget.controller.cepList[widget.index].cep
                                .replaceAll('-', ''),
                            widget.controller.cepList[widget.index]
                                .copyWith(
                                    logradouro: logradouro.text,
                                    complemento: complemento.text)
                                .toMap());
                        widget.update();
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
