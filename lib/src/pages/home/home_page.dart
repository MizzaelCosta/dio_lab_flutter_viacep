import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/home/home_state.dart';
import '../../services/request_service.dart';
import '../../utils/formatter.dart';
import '../../utils/validator.dart';
import '../../widgets/input_text.dart';
import '../../widgets/search_cep.dart';
import '../listed/listed_page.dart';
import 'home_controller.dart';

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
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(
        service: context.read<RequestService>(),
        state: context.read<HomeState>())
      ..setCep(_cep)
      ..addListener(_onUpdateState);
  }

  @override
  void dispose() {
    _cep.dispose();
    _formKey.currentState!.dispose();
    _homeController.dispose();
    super.dispose();
  }

  void _onUpdateState() {
    (context as Element).markNeedsBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      sufixIcon: SearchCep(_homeController.getCep),
                      controller: _homeController.cep,
                      centerAlign: true,
                      validator: Validator.length(
                        error: 'O Cep deve ter 8 dígitos.',
                        length: 8,
                      ),
                      formatter: const [Formatter()],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _homeController.state.build(),
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
