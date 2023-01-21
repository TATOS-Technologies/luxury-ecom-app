import 'package:avoirchic/app/presentation/common_widgets/common_animations/error_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

class ErrorDataWidget extends StatelessWidget {
  ErrorDataWidget({Key? key, this.error}) : super(key: key);
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ErrorAnimation(),
            if (error?.isNotEmpty == true)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error!,
                  style: AppTextStyle.textStyleUtils500(),
                  textAlign: TextAlign.center,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                LanguageConstants.workingOnIssue.tr,
                style: AppTextStyle.textStyleUtils500(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: CommonTextPoppins(
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
