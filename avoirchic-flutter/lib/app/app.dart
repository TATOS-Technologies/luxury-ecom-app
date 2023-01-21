import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/translation_service.dart';
import 'package:avoirchic/app/presentation/screens/app_pages.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/consts/app_constants.dart';

class AvoirchicApp extends StatefulWidget {
  const AvoirchicApp({Key? key}) : super(key: key);

  @override
  State<AvoirchicApp> createState() => _AvoirchicAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _AvoirchicAppState extends State<AvoirchicApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Avoirchic App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: primaryWhite,
            scaffoldBackgroundColor: primaryWhite,
            fontFamily: AppConstants.fontPoppins,
            hintColor: regularGrey,
            iconTheme: const IconThemeData(
              color: regularGrey,
              size: 24,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 1,
              // ignore: deprecated_member_use
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
              backgroundColor: primaryWhite,
              foregroundColor: titleBlack,
              centerTitle: true,
            )),
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        getPages: AppPages.routes,
        initialRoute: RoutesConstants.splashScreen,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
      ),
    );
  }

  @override
  void dispose() {
    stopSentry();
    super.dispose();
  }

  /// close sentry handling
  void stopSentry() async {
    await Sentry.close();
  }
}
