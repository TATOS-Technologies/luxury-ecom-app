import 'package:avoirchic/app/controller/privacy_policy_controller.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ExpandDetailWidget extends GetView<PrivacyPolicyController> {
  final String text;
  final String subText;
  final int value;

  const ExpandDetailWidget(
      {Key? key,
      required this.text,
      required this.subText,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.index.value == value) {
            controller.index.value = 0;
          } else {
            controller.index.value = value;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(text, style: AppTextStyle.textStyleUtils500()),
                  ),
                  controller.index.value == value
                      ? const Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 20,
                        )
                      : const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
                ],
              ),
              Visibility(
                visible: controller.index.value == value ? true : false,
                child: Html(
                  data: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
