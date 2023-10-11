import 'package:dio_lab_flutter_viacep/src/models/cep.dart';
import 'package:dio_lab_flutter_viacep/src/pages/home/home_update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/formatter.dart';
import '../../utils/validator.dart';
import '../../widgets/input_text.dart';
import '../../widgets/search_cep.dart';
import '../../widgets/show_cep.dart';
import '../listed/listed_page.dart';

typedef UpdateFunction = void Function(
    {bool isLoading, Cep? response, required String text});

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
  bool _isLoading = false;
  Cep? cep;
  late Function update;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cep.dispose();
    _formKey.currentState!.dispose();
    super.dispose();
  }

  homeUpdate({bool isLoading = false, Cep? response, required String text}) {
    setState(() {
      _isLoading = isLoading;
      cep = response;
      _cep.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeUpdate(
        cepTextEditingController: _cep,
        homeUpdate: homeUpdate,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Buscar Cep'),
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
                        label: 'Cep',
                        sufixIcon: const SearchCep(),
                        controller: _cep,
                        centerAlign: true,
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
                  visible: _isLoading,
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
      ),
    );
  }
}
