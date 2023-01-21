// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:crypto/crypto.dart';

class GlobalSingleton {
  static final GlobalSingleton globalSingleton = GlobalSingleton._internal();

  factory GlobalSingleton() {
    return globalSingleton;
  }

  GlobalSingleton._internal();

  String? deviceToken;

  String sha256ofString(String input) {
    /// Returns the sha256 hash of [input] in hex notation.

    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  List<dynamic> optionList = [];
}
