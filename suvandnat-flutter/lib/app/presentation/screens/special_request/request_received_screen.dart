import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class RequestReceivedScreen extends StatelessWidget {
  const RequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(RoutesConstants.dashboardScreen);
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        LanguageConstants.yourRequestHasBeenReceived.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(size: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        LanguageConstants.youCanViewYourRequestsAtMyTickets.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesConstants.myTickets);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: red973133,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Text(
                      LanguageConstants.myTicketsText.tr,
                      style: AppTextStyle.textStyleUtils600(
                          color: Colors.white, size: 13.5),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(RoutesConstants.dashboardScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: red973133,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Text(
                      LanguageConstants.continueShopping.tr,
                      style: AppTextStyle.textStyleUtils600(
                          color: Colors.white, size: 13.5),
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
