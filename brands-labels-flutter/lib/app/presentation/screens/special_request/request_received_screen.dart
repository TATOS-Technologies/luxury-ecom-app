import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        appBar: commonAppbar(title: LanguageConstants.yourRequestHasBeenReceived.tr),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                requestReceivedWidget(),
                SizedBox(height: 30.h),
                CommonThemeButton(
                  onTap: () {
                    Get.offAndToNamed(RoutesConstants.myTicketScreen);
                  },
                  title:
                      LanguageConstants.myTicketsText.tr,
                   
                ),
                const SizedBox(height: 10),
                CommonThemeButton(
                  onTap: () {
                    Get.offAllNamed(RoutesConstants.dashboardScreen);
                  },
                  title:
                      LanguageConstants.continueShopping.tr,
                   
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget requestReceivedWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          // Text(
          //   LanguageConstants.yourRequestHasBeenReceived.tr,
          //   textAlign: TextAlign.center,
          //   style: AppTextStyle.textStyleUtilsUnderLine20(
          //     color: blackColor,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          // const SizedBox(height: 10),
          Text(
            LanguageConstants.youCanViewYourRequestsatMyTickets.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(),
          ),
        ],
      ),
    );
  }
}
