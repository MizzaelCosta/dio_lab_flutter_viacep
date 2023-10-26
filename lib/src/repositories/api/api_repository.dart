import '../../models/cep.dart';

abstract class ApiRepository {
  Future<Cep> getCep(String cep);
}
