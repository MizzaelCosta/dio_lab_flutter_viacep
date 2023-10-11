import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/listed/listed_controller.dart';
import 'edit_info.dart';

class ListedCard extends StatelessWidget {
  const ListedCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ListedController>();

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfo(
                        index: index,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  controller.deleteCep(
                      controller.cepList[index].cep.replaceAll('-', ''));
                  controller.listedUpdate();
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
