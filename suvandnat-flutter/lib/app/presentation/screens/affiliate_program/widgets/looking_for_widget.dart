import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';

class LookingForWidget extends StatelessWidget {
  const LookingForWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.whoAreWeLookingTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.whoAreWeLookingDescriptionOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
