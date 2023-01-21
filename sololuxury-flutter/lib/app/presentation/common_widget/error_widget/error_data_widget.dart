// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/error_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_opensans.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class ErrorDataWidget extends StatelessWidget {
  ErrorDataWidget({Key? key, this.error}) : super(key: key);
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ErrorAnimationWidget(),
            if (error?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error!,
                  style: AppStyle.textStyleUtils500(color: appColorButton),
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                LanguageConstants.workingOnIssue.tr,
                style: AppStyle.textStyleUtils500(color: appColorButton),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.back<dynamic>();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
