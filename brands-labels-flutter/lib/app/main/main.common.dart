import 'dart:async';

import 'package:brandslabels/app/app.dart';
import 'package:brandslabels/app/core/config/env_configs.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../core/consts/app_constants.dart';
import '../helper/notification_service.dart';

LocalStore localStore = LocalStore();
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
          // deviceInfo = Platform.isAndroid
          //     ? await DeviceInfoPlugin().androidInfo
          //     : await DeviceInfoPlugin().iosInfo;
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
              child: const BrandsLabelsApp(),
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
