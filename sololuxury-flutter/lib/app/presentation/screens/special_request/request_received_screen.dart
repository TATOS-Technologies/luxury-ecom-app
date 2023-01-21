import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/core/utils/app_routes.dart';
import 'package:solo_luxury/app/presentation/screens/special_request/widgets/request_received_widget.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class RequestReceivedScreen extends StatelessWidget {
  const RequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
        return true;
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RequestReceivedWidget(),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed<dynamic>(RoutesConstants.myTicketsScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Text(
                      LanguageConstants.myTicketsText.tr,
                      style: AppStyle.textStyleUtils600(
                          size: 13.5, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Text(
                      LanguageConstants.continueShopping.tr,
                      style: AppStyle.textStyleUtils600(
                          size: 13.5, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
