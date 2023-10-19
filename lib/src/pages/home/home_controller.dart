// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio_lab_flutter_viacep/src/services/request_service.dart';
import 'package:flutter/material.dart';

import '../../models/cep.dart';

class HomeController extends ChangeNotifier {
  HomeController(
    this._service,
  );

  final RequestService _service;

  bool isLoading = false;
  Cep? response;
  TextEditingController? _strCep;

  TextEditingController get strCep {
    if (_strCep == null) {
      _strCep?.text = '';
    }
    return _strCep!;
  }

  void setCep(TextEditingController cep) {
    _strCep = cep;
  }

  void getCep() async {
    _loading(true);
    response = await _service.getCep(_strCep!.text);
    _emptyTextEditing();
    _loading(false);
  }

  void _loading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  void _emptyTextEditing() {
    strCep.text = '';
  }
}
