import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/app.dart';
import 'package:solo_luxury/app/core/config/env_configs.dart';

import 'package:solo_luxury/app/helper/deep_linking_service.dart';

LocalStore localStore = LocalStore();
String? deviceModel;
PackageInfo packageInfo = PackageInfo(
  appName: 'Unknown',
  packageName: 'Unknown',
  version: 'Unknown',
  buildNumber: 'Unknown',
  buildSignature: 'Unknown',
);

//Call Android Module
const platform = MethodChannel('flutter.native/helper');

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env");
  EnvSecretConfigs();

  await SentryFlutter.init(
    (options) {
      options.dsn = EnvSecretConfigs.instance.sentryDSNToken;
      options.tracesSampleRate = 1.0; // needed for Dio `networkTracing` feature
      // if (kDebugMode) options.debug = true;
      options.sendDefaultPii = true;
    },
    appRunner: () async {
      initMessaging();
      backgroundNotification();
      await GetStorage.init();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then((_) async {
        await runZonedGuarded(() async {
          await Firebase.initializeApp();

          DynamicLinkingService.registerDynamicLinkHandler();
          if (Platform.isAndroid) {
            deviceModel = (await DeviceInfoPlugin().androidInfo).model;
          } else if (Platform.isIOS) {
            deviceModel = (await DeviceInfoPlugin().iosInfo).model;
          }
          packageInfo = await PackageInfo.fromPlatform();
          if (!kDebugMode) {
            // record exception when app is in release mode
            FlutterError.onError =
                FirebaseCrashlytics.instance.recordFlutterError;
            FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
          }
          runApp(
            DefaultAssetBundle(
              bundle: SentryAssetBundle(),
              child: const SoloLuxuryApp(),
            ),
          );
        }, (exception, stackTrace) async {
          if (!kDebugMode) {
            // record exception when app is in release mode
            await Sentry.captureException(exception, stackTrace: stackTrace);
          }
        });
      });
    },
  );
}

// test
