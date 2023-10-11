import '../../models/cep.dart';
import '../../repositories/local/local_repository.dart';

class ListedController {
  ListedController(this._repository);

  List<Cep> cepList = [];
  final LocalRepository _repository;
  late Function listedUpdate;

  Future<void> updateCep(String key, Map<dynamic, dynamic> cep) async {
    await _repository.updateCep(key, cep);
  }

  Future<void> deleteCep(String key) async {
    await _repository.deleteCep(key);
  }

  Future<void> getAllCep() async {
    final list = await _repository.getAllCep();
    cepList = list.map((e) => Cep.fromMap(e)).toList();
  }
}
