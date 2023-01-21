import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';

class ApplyForWidget extends StatelessWidget {
  const ApplyForWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.howApplyTitleText.tr,
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
                  title: LanguageConstants.howApplyAnswerOneText.tr,
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
