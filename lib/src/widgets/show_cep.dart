import 'package:flutter/material.dart';

import '../../src/models/cep.dart';

class ShowCep extends StatelessWidget {
  const ShowCep(
    this.cep, {
    super.key,
  });

  final Cep cep;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cep: ${cep.cep}'),
        Text('Rua: ${cep.logradouro}'),
        Visibility(
          visible: cep.complemento.isNotEmpty,
          child: Text(
            'Complemento: ${cep.complemento}',
          ),
        ),
        Text('Bairro: ${cep.bairro}'),
        Text('Cidade: ${cep.localidade}'),
        Text('DDD: ${cep.ddd}'),
      ],
    );
  }
}
