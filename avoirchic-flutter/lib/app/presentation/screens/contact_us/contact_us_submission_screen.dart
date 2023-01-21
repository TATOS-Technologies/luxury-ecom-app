// import 'package:solo_luxury/presentation/screens/dashboard/dashboard_screen.dart';

import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/contact_us_controller.dart';
import '../../../core/utils/app_routes.dart';
import '../../common_widgets/common_widget/common_text_opensans.dart';
import '../../common_widgets/common_widget/common_text_poppins.dart';

class ContactUsSubmissionScreen extends GetView<ContactUsController> {
  const ContactUsSubmissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: lightBlue,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(children: [
        // Image.asset(
        //   AppAsset.checkoutBG,
        //   width: Get.width,
        //   height: Get.height,
        //   fit: BoxFit.fill,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: Get.height / 4.5),
              child: SizedBox(
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.weWillGetInTouchSoon.tr,
                      style: AppTextStyle.textStyleUtils500()
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.weHaveReceivedYourRequest.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.and.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.weWillGetInTouchSoon.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.youCanViewResponsesOnYourEmailText.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.and.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: CommonTextPoppins(
                        LanguageConstants.underMyTicketsText.tr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(RoutesConstants.dashboardScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: appTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.continueShopping.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAndToNamed(RoutesConstants.loginScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: appTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.loginMyAccountText.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
