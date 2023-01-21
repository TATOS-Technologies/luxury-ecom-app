import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/contact_us/contact_us_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class SubmitAccountButton extends GetView<ContactUsController> {
  @override
  final ContactUsController controller = Get.find();
  SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {
          controller.submitButton(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        child: Text(
          LanguageConstants.submitText.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: AppTextStyle.textStyleUtils400(color: whiteColor),
        ),
      ),
    );
  }
}
