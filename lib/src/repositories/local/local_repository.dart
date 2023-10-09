abstract class LocalRepository {
  Future<void> insertCep(String key, Map<String, dynamic> cep);
  Future<Map<dynamic, dynamic>?> getCep(String key);
  Future<List<Map<dynamic, dynamic>>> getAllCep();
  Future<void> updateCep(String key, Map<dynamic, dynamic> cep);
  Future<void> deleteCep(String key);
}
