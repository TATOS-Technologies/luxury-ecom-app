import 'package:avoirchic/app/core/consts/image_constant.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: backGroundColor,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(ImageConstant.bgImage),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  requestReceivedWidget(),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RoutesConstants.myTicketScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: avoirChickTheme,
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
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesConstants.dashboardScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: avoirChickTheme,
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
      ),
    );
  }

  Widget requestReceivedWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(LanguageConstants.yourRequestHasBeenReceived.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtilsUnderLine18()),
          const SizedBox(height: 10),
          Text(LanguageConstants.youCanViewYourRequestsatMyTickets.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils400_16()),
        ],
      ),
    );
  }
}
