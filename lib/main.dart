import 'package:dio_lab_flutter_viacep/src/pages/home/home_controller.dart';
import 'package:dio_lab_flutter_viacep/src/repositories/local/hive_repository.dart';
import 'package:dio_lab_flutter_viacep/src/services/request_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/pages/listed/listed_controller.dart';
import 'src/repositories/api/dio_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var diretory = await getApplicationDocumentsDirectory();
  Hive.init(diretory.path);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(
            RequestService(
              DioRepository(),
              HiveRepository(),
            ),
          ),
        ),
        Provider<ListedController>(
          create: (_) => ListedController(
            HiveRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
