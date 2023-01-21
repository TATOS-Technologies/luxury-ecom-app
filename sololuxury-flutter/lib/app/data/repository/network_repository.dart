import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();

  factory NetworkRepository() {
    return _networkRepository;
  }

  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();
}
