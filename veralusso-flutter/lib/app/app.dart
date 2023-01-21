import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/translation_service.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_pages.dart';
import 'package:veralusso/app/theme/colors.dart';

class VeralussoApp extends StatefulWidget {
  const VeralussoApp({Key? key}) : super(key: key);

  @override
  VeralussoAppState createState() => VeralussoAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class VeralussoAppState extends State<VeralussoApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Veralusso',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: primaryWhite,
            scaffoldBackgroundColor: primaryWhite,
            fontFamily: AppConstants.fontMontserrat,
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
        getPages: AppPages.routes,
        //initialRoute: RoutesConstants.checkoutOrderScreen,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
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
