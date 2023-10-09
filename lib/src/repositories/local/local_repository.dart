abstract class LocalRepository {
  Future<void> insertCep(String key, Map<String, dynamic> cep);
  Future<Map<dynamic, dynamic>?> getCep(String key);
  Future<void> updateCep(String key, Map<String, dynamic> cep);
  Future<void> deleteCep(String key);
}
