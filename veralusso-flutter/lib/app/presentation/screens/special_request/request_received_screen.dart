import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/request_receiced_widgets.dart';

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
        backgroundColor: whiteColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RequestReceivedWidgets(),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed(RoutesConstants.myTicketsScreen);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: blackColor.withOpacity(1),
                    side: BorderSide(
                      width: 1.0,
                      color: blackColor.withOpacity(
                        1,
                      ),
                    ),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    LanguageConstants.myTicketsText.tr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Get.offAllNamed(RoutesConstants.dashboardScreen);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: blackColor.withOpacity(1),
                    side: BorderSide(
                      width: 1.0,
                      color: blackColor.withOpacity(
                        1,
                      ),
                    ),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    LanguageConstants.continueShopping.tr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyle.textStyleUtils400(),
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
