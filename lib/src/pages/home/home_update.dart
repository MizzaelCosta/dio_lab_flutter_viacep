import 'package:flutter/material.dart';

import '../../models/cep.dart';
import 'home_page.dart';

class HomeUpdate {
  HomeUpdate({
    this.cepResponse,
    required this.cepTextEditingController,
    required this.homeUpdate,
    this.isLoading = false,
  });

  UpdateFunction homeUpdate;
  bool isLoading;
  Cep? cepResponse;
  TextEditingController cepTextEditingController;
}
