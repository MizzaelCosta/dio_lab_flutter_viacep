import 'package:flutter/material.dart';

import '../pages/listed/listed_controller.dart';
import 'edit_info.dart';

class ListedCard extends StatelessWidget {
  const ListedCard({
    super.key,
    required this.index,
    required this.listedController,
  });

  final int index;
  final ListedController listedController;

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
              Text(listedController.cepList[index].cep),
              Text(listedController.cepList[index].logradouro),
              Visibility(
                visible: (listedController.cepList[index].complemento != ''),
                child: Text(listedController.cepList[index].complemento),
              ),
            ]),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfo(
                        index: index,
                        listedController: listedController,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  listedController.deleteCep(
                      listedController.cepList[index].cep.replaceAll('-', ''));
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
