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
  Future<List<Map<dynamic, dynamic>>> getAllCep() async {
    final storage = await Hive.openBox(boxName);
    final values = storage.values.cast<Map<dynamic, dynamic>>().toList();

    return values;
  }

  @override
  Future<void> insertCep(String key, Map<String, dynamic> cep) async {
    final storage = await Hive.openBox(boxName);
    await storage.put(key, cep);
  }

  @override
  Future<void> updateCep(String key, Map<dynamic, dynamic> cep) async {
    insertCep(key, cep as Map<String, dynamic>);
  }

  @override
  Future<void> deleteCep(String key) async {
    final storage = await Hive.openBox(boxName);
    await storage.delete(key);
  }
}
