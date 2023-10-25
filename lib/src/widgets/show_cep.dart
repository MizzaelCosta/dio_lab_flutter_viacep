import 'package:flutter/material.dart';

import '../pages/home/home_controller.dart';

class ShowCep extends StatelessWidget {
  const ShowCep(
    this.homeController, {
    super.key,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cep: ${homeController.state.response!.cep}'),
        Text('Rua: ${homeController.state.response!.logradouro}'),
        Visibility(
          visible: homeController.state.response!.complemento.isNotEmpty,
          child: Text(
            'Complemento: ${homeController.state.response!.complemento}',
          ),
        ),
        Text('Bairro: ${homeController.state.response!.bairro}'),
        Text('Cidade: ${homeController.state.response!.localidade}'),
        Text('DDD: ${homeController.state.response!.ddd}'),
      ],
    );
  }
}
