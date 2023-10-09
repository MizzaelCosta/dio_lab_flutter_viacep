import 'package:dio_lab_flutter_viacep/src/services/request_service.dart';

import '../../models/cep.dart';

class HomeController {
  HomeController(
    this._service,
  );

  final RequestService _service;

  Future<Cep> getCep(String cep) {
    return _service.getCep(cep);
  }
}
