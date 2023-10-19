import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class ShowCep extends StatelessWidget {
  const ShowCep(
    this.homeController, {
    super.key,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: homeController.response != null,
      child: (homeController.response == null || homeController.response!.erro)
          ? const Center(
              child: Text('Cep NÃO encontrado. Verifique o CEP digitado.'),
            )
          : //

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cep: ${homeController.response!.cep}'),
                Text('Rua: ${homeController.response!.logradouro}'),
                Visibility(
                  visible: homeController.response!.complemento.isNotEmpty,
                  child: Text(
                    'Complemento: ${homeController.response!.complemento}',
                  ),
                ),
                Text('Bairro: ${homeController.response!.bairro}'),
                Text('Cidade: ${homeController.response!.localidade}'),
                Text('DDD: ${homeController.response!.ddd}'),
              ],
            ),
    );
  }
}
