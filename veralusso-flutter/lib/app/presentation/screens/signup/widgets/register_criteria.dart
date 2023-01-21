import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/signup/signup_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class RegisterCriteria extends GetView<SignUpController> {
  @override
  final SignUpController controller = Get.find();

  RegisterCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5.0),
        SizedBox(
            height: 45.h,
            width: 327.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: CommonTextPoppins(
                LanguageConstants.signUpText.tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              onPressed: () {
                controller.signUpUser();
              },
            )),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
