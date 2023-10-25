import '../../models/cep.dart';

abstract class HomeState {
  HomeState(this.response);

  final Cep? response;
}

class HomeStateEmpty extends HomeState {
  HomeStateEmpty(super.response);
}

class HomeStateLoading extends HomeState {
  HomeStateLoading(super.response);
}

class HomeStateSuccess extends HomeState {
  HomeStateSuccess(super.response);
}

class HomeStateError extends HomeState {
  HomeStateError(super.response);
}
