import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/privacy_policy/privacy_policy_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class ExpandDetailWidget extends GetView<PrivacyPolicyController> {
  final String text;
  final String subText;
  final int value;
  @override
  final PrivacyPolicyController controller = Get.find();
  ExpandDetailWidget(this.text, this.subText, this.value, {Key? key})
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
                    child: Text(
                      text,
                      style: AppTextStyle.textStyleUtils300(),
                    ),
                  ),
                  controller.index.value == value
                      ? const Icon(Icons.remove, color: Colors.black)
                      : const Icon(Icons.add, color: Colors.black),
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
