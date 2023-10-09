// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:dio_lab_flutter_viacep/src/models/cep.dart';
import 'package:dio_lab_flutter_viacep/src/repositories/api/api_repository.dart';
import 'package:flutter/material.dart';

class DioRepository implements ApiRepository {
  @override
  Future<Cep> getCep(String cep) async {
    try {
      final dio = Dio();

      final Cep cepData;

      final response = await dio.get('http://viacep.com.br/ws/$cep/json/');

      if (response.statusCode == 200) {
        if ((response.data.runtimeType != String)) {
          if (!(response.data).containsKey('erro')) {
            return cepData = Cep.fromMap(response.data);
          }
        }
      }
    } on Exception {
      //TODO implementar excessões
      debugPrint('erro: Excessão DioRepository');
    }

    return Cep.erro();
  }
}
