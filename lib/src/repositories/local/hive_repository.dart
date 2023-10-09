import 'package:dio_lab_flutter_viacep/src/repositories/local/local_repository.dart';
import 'package:hive/hive.dart';

class HiveRepository implements LocalRepository {
  final String boxName = 'storageBox';

  @override
  Future<Map<dynamic, dynamic>?> getCep(String key) async {
    final storage = await Hive.openBox(boxName);
    final Map<dynamic, dynamic>? value = await storage.get(key);

    return value;
  }

  @override
  Future<void> insertCep(String key, Map<String, dynamic> cep) async {
    final storage = await Hive.openBox(boxName);
    await storage.put(key, cep);
  }

  @override
  Future<void> updateCep(String key, Map<String, dynamic> cep) async {
    // TODO: implementar updateCep / Aguardando Tela de Ceps buscados
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCep(String cep) {
    // TODO: implementar deleteCep / Aguardando Tela de Ceps buscados
    throw UnimplementedError();
  }
}
