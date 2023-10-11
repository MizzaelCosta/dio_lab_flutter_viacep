import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowCep extends StatelessWidget {
  const ShowCep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = context.read<HomeController>();

    return Visibility(
      visible: homeController.cepResponse != null,
      child: (homeController.cepResponse == null ||
              homeController.cepResponse!.erro)
          ? const Center(
              child: Text('Cep NÃO encontrado. Verifique o CEP digitado.'),
            )
          : //

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cep: ${homeController.cepResponse!.cep}'),
                Text('Rua: ${homeController.cepResponse!.logradouro}'),
                Visibility(
                  visible: homeController.cepResponse!.complemento.isNotEmpty,
                  child: Text(
                    'Complemento: ${homeController.cepResponse!.complemento}',
                  ),
                ),
                Text('Bairro: ${homeController.cepResponse!.bairro}'),
                Text('Cidade: ${homeController.cepResponse!.localidade}'),
                Text('DDD: ${homeController.cepResponse!.ddd}'),
              ],
            ),
    );
  }
}
