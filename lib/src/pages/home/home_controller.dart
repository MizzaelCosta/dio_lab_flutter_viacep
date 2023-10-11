// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_lab_flutter_viacep/src/services/request_service.dart';
import 'package:flutter/material.dart';

import '../../models/cep.dart';

class HomeController extends ChangeNotifier {
  HomeController(
    this._service,
  );

  final RequestService _service;

  TextEditingController? strCep;
  bool isLoading = false;
  Cep? cepResponse;

  void getCep(String cep) async {
    loading(true);
    cepResponse = await _service.getCep(cep);
    emptyTextEditing();
    loading(false);
  }

  void loading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  void setTextEditing(TextEditingController cepEditing) {
    strCep = cepEditing;
  }

  void emptyTextEditing() {
    if (strCep != null) {
      strCep!.text = '';
    }
  }
}
