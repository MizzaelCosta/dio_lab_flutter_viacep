import 'package:flutter/material.dart';

import '../../models/cep.dart';
import '../../repositories/local/local_repository.dart';

class ListedController extends ChangeNotifier {
  ListedController(this._repository);

  List<Cep> cepList = [];
  final LocalRepository _repository;

  Future<void> updateCep(String key, Map<dynamic, dynamic> cep) async {
    await _repository.updateCep(key, cep);
    getAllCep();
  }

  Future<void> deleteCep(String key) async {
    await _repository.deleteCep(key);
    getAllCep();
  }

  Future<void> getAllCep() async {
    final list = await _repository.getAllCep();
    cepList = list.map((e) => Cep.fromMap(e)).toList();
    notifyListeners();
  }
}
