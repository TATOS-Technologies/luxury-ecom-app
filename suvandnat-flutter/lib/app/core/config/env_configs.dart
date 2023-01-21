import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:suvandnat/app/core/const/key_value_constants.dart';

class EnvSecretConfigs {
  EnvSecretConfigs._internal({
    required this.sentryDSNToken,
  });

  final String sentryDSNToken;

  static late EnvSecretConfigs _instance;

  factory EnvSecretConfigs() {
    if (dotenv.env[kAuthTokenSentryDSNToken] == null) {
      throw Exception("Missing tokens in environment");
    }

    final String sentryT = dotenv.env[kAuthTokenSentryDSNToken] ?? "";

    _instance = EnvSecretConfigs._internal(
      sentryDSNToken: sentryT,
    );
    return _instance;
  }

  static EnvSecretConfigs get instance => _instance;
}
