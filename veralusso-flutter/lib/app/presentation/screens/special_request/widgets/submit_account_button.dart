import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/special_request/special_request_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class SubmitAccountButton extends GetView<SpecialRequestController> {
  @override
  final SpecialRequestController controller = Get.find();
  SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        controller.contactUsPost(
          context,
        );
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: blackColor.withOpacity(1),
        side: BorderSide(
          width: 1.0,
          color: blackColor.withOpacity(
            1,
          ),
        ),
        shape: const StadiumBorder(),
      ),
      child: Text(
        LanguageConstants.submitText.tr,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTextStyle.textStyleUtils400(),
      ),
    );
  }
}
