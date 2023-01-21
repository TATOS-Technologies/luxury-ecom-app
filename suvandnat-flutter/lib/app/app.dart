import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/translation_service.dart';
import 'package:suvandnat/app/presentation/app_pages.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/colors.dart';

class SuvandantApp extends StatefulWidget {
  const SuvandantApp({Key? key}) : super(key: key);

  @override
  _SuvandantAppState createState() => _SuvandantAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _SuvandantAppState extends State<SuvandantApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Grub-Grams-App',
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

        // initialRoute: RoutesConstants.logoutSuccess,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        getPages: AppPages.routes,
        locale: TranslationService.locale,
        initialRoute: RoutesConstants.splashScreen,
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
