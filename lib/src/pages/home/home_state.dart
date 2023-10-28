import 'package:flutter/material.dart';

import '../../models/cep.dart';
import '../../widgets/show_cep.dart';

abstract class HomeState {
  HomeState(this.response);

  final Cep? response;
  Widget build();
}

class HomeStateEmpty extends HomeState {
  HomeStateEmpty(super.response);

  @override
  Widget build() => const Center();
}

class HomeStateLoading extends HomeState {
  HomeStateLoading(super.response);

  @override
  Widget build() => const Center(child: CircularProgressIndicator());
}

class HomeStateSuccess extends HomeState {
  HomeStateSuccess(this._response) : super(_response);

  final Cep _response;

  @override
  Widget build() => ShowCep(_response);
}

class HomeStateError extends HomeState {
  HomeStateError(super.response);

  @override
  Widget build() => const Center(
      child: Text('CEP NÃO encontrado. Verifique o CEP digitado.'));
}
