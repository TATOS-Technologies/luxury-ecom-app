import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class RegisterButton extends GetView<ReferFriendController> {
  @override
  final ReferFriendController controller = Get.find();
  RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 45.h,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          controller.postData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        child: Text(
          LanguageConstants.registerText.tr,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style:  AppTextStyle.textStyleUtils400(color: whiteColor)
        ),
      ),
    );
  }
}
