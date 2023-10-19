import 'package:dio_lab_flutter_viacep/src/repositories/local/local_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/repositories/api/dio_repository.dart';
import 'src/repositories/local/hive_repository.dart';
import 'src/services/request_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var diretory = await getApplicationDocumentsDirectory();
  Hive.init(diretory.path);

  runApp(
    MultiProvider(
      providers: [
        Provider<LocalRepository>(
          create: (_) => HiveRepository(),
        ),
        Provider<RequestService>(
          create: (_) => RequestService(
            DioRepository(),
            HiveRepository(),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
