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
  TextEditingController? _cep;

  TextEditingController get cep {
    if (_cep == null) {
      _cep?.text = '';
    }
    return _cep!;
  }

  void setCep(TextEditingController? value) {
    if (value != null) {
      _cep = value;
      return;
    }
    _cep?.text = '';
  }

  void getCep() async {
    _loading(true);
    response = await _service.getCep(_cep!.text);
    setCep(null);
    _loading(false);
  }

  void _loading(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }
}
