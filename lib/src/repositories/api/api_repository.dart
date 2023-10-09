import 'package:dio_lab_flutter_viacep/src/models/cep.dart';

abstract class ApiRepository {
  Future<Cep> getCep(String cep);
}
