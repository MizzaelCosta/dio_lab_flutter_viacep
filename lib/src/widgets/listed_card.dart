import 'package:flutter/material.dart';

import '../pages/listed/listed_controller.dart';

class ListedCard extends StatelessWidget {
  const ListedCard(
      {super.key,
      required this.controller,
      required this.update,
      required this.index});

  final ListedController controller;
  final Function update;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(controller.cepList[index].cep),
              Text(controller.cepList[index].logradouro),
              Visibility(
                visible: (controller.cepList[index].complemento != ''),
                child: Text(controller.cepList[index].complemento),
              ),
            ]),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  //TODO implementar tela de edição (rua/complemento)
                  controller.updateCep(
                      controller.cepList[index].cep.replaceAll('-', ''),
                      controller.cepList[index]
                          .copyWith(
                              logradouro: 'Rua editada',
                              complemento: 'Complemento editado')
                          .toMap());
                  update();
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  controller.deleteCep(
                      controller.cepList[index].cep.replaceAll('-', ''));
                  update();
                },
                icon: const Icon(Icons.delete),
              )
            ],
          ),
        ],
      ),
    );
  }
}
