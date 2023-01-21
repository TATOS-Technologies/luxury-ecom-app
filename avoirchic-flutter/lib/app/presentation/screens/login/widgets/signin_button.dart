import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/login_controller.dart';
import '../../../common_widgets/common_widget/common_text_opensans.dart';

class SignInButtonWidget extends GetView<LoginController> {
  const SignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.w,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {
          controller.loginUser();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CommonTextOpenSans(
          LanguageConstants.signInText.tr,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
