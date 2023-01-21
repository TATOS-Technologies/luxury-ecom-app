import 'package:flutter/foundation.dart';

class Logger {
  static const String loggerTag = 'Logger';

  static void d(String tag, dynamic message) {
    if (kReleaseMode) return;
    try {
      debugPrint('$loggerTag : $tag : $message');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void e(dynamic message) {
    if (kReleaseMode) return;
    try {
      debugPrint('$loggerTag : ERROR : ${message.toString()}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
