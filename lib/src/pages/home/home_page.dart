import 'package:dio_lab_flutter_viacep/src/models/cep.dart';
import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:dio_lab_flutter_viacep/src/pages/listed/listed_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/formatter.dart';
import '../../utils/validator.dart';
import '../../widgets/input_text.dart';
import '../../widgets/show_cep.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _cep = TextEditingController();
  late HomeController _controller;
  bool _loading = false;
  Cep? cep;

  @override
  void initState() {
    super.initState();
    _controller = context.read<HomeController>();
  }

  @override
  void dispose() {
    _cep.dispose();
    _formKey.currentState!.dispose();
    super.dispose();
  }

  void update(bool newValue, {Cep? response, required String text}) {
    setState(() {
      _loading = newValue;
      cep = response;
      _cep.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ViaCep'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    InputText(
                      cep: _cep,
                      controller: _controller,
                      update: update,
                      validator: Validator.length(
                        error: 'O Cep deve ter 8 dígitos.',
                        length: 8,
                      ),
                      formatter: const [
                        Formatter(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Visibility(
                visible: _loading,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Visibility(
                visible: cep != null,
                child: (cep == null || cep!.erro)
                    ? const Center(
                        child: Text(
                            'Cep NÃO encontrado. Verifique o CEP digitado.'),
                      )
                    : ShowCep(cep: cep),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListedPage(),
            ),
          );
        },
        child: const Icon(Icons.list_alt_outlined),
      ),
    );
  }
}
