import 'package:dio_lab_flutter_viacep/src/pages/listed/listed_controller.dart';
import 'package:flutter/material.dart';

import '../../repositories/local/hive_repository.dart';

class ListedPage extends StatefulWidget {
  const ListedPage({super.key});

  @override
  State<ListedPage> createState() => _ListedPageState();
}

class _ListedPageState extends State<ListedPage> {
  final _controller = ListedController(HiveRepository());

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() async {
    await _controller.getAllCep();
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
          itemCount: _controller.cepList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_controller.cepList[index].cep),
                          Text(_controller.cepList[index].logradouro),
                        ]),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //TODO implementar tela de edição (rua/complemento)
                          _controller.updateCep(
                              _controller.cepList[index].cep
                                  .replaceAll('-', ''),
                              _controller.cepList[index]
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
                          _controller.deleteCep(_controller.cepList[index].cep
                              .replaceAll('-', ''));
                          update();
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
