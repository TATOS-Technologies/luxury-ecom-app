import 'package:brandslabels/app/core/utils/lang_directory/translation_service.dart';
import 'package:brandslabels/app/presentation/screens/app_pages.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/consts/app_constants.dart';

class BrandsLabelsApp extends StatefulWidget {
  const BrandsLabelsApp({Key? key}) : super(key: key);

  @override
  BrandsLabelsAppState createState() => BrandsLabelsAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class BrandsLabelsAppState extends State<BrandsLabelsApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Brands And Labels',
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
        getPages: AppPages.routes,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        //initialRoute: RoutesConstants.storeCreditScreen,
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
