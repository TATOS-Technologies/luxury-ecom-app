import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';
import 'package:solo_luxury/app/core/utils/lang_directory/translation_service.dart';
import 'package:solo_luxury/app/helper/notification_helper.dart';
import 'package:solo_luxury/app/presentation/screens/app_pages.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class SoloLuxuryApp extends StatefulWidget {
  const SoloLuxuryApp({Key? key}) : super(key: key);

  @override
  SoloLuxuryAppState createState() => SoloLuxuryAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class SoloLuxuryAppState extends State<SoloLuxuryApp> {
  @override
  void initState() {
    notificationPermission();
    sendMeNotification();
    super.initState();
  }

  @override
  void dispose() {
    stopSentry();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Solo Luxury',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: primaryWhite,
            scaffoldBackgroundColor: primaryWhite,
            fontFamily: AppConstants.fontOpenSans,
            //fontFamily: 'Roboto',
            hintColor: regularGrey,
            iconTheme: const IconThemeData(
              color: regularGrey,
              size: 24,
            ),
            appBarTheme: AppBarTheme(
              elevation: 1,
              backgroundColor: primaryWhite,
              foregroundColor: titleBlack,
              centerTitle: true,
              toolbarTextStyle:
                  const TextTheme(headline6: TextStyle(color: Colors.white))
                      .bodyText2,
              titleTextStyle:
                  const TextTheme(headline6: TextStyle(color: Colors.white))
                      .headline6,
            ),
          ),
          navigatorObservers: [
            SentryNavigatorObserver(),
          ],
          getPages: AppPages.routes,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
        );
      },
    );
  }

  /// close sentry handling
  void stopSentry() async {
    await Sentry.close();
  }
}
