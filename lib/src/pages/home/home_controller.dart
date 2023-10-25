// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../models/cep.dart';
import '../../pages/home/home_state.dart';
import '../../services/request_service.dart';

class HomeController extends ChangeNotifier {
  HomeController({
    required service,
    required this.state,
  }) : _service = service;

  final RequestService _service;
  Cep? _response;
  HomeState state;
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
    _setState(HomeStateLoading(null));
    _response = await _request();
    (_response == null || (_response != null && _response!.erro))
        ? _setState(HomeStateError(null))
        : _setState(HomeStateSuccess(_response));
  }

  void _setState(HomeState newState) {
    state = newState;
    notifyListeners();
  }

  Future<Cep> _request() async {
    final cepResponse = await _service.getCep(cep.text);
    setCep(null);
    return cepResponse;
  }
}
