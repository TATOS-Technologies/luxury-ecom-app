import 'package:brandslabels/app/presentation/common_widgets/common_animations/error_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
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
                'We are working on this issue. Please try again later',
                style: AppTextStyle.textStyleUtils500(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonThemeButton(
                onTap: () {
                  Get.back();
                },
                title:
                  LanguageConstants.continueShopping.tr,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
