import 'package:avoirchic/app/controller/influencer_registration_controller.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/colors.dart';

class TextFormFieldWidget extends GetView<InfluencerRegistrationController> {
  final String? hintText;
  final double? height;
  final double? bottomPadding;
  final double? topPadding;
  final FormFieldValidator<String>? validation;
  final TextEditingController? textEditingController;

  const TextFormFieldWidget(
      {Key? key,
      this.hintText,
      this.height,
      this.bottomPadding,
      this.topPadding,
      this.validation,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderGrey,
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: textEditingController,
        validator: validation,
        cursorColor: blackColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          // contentPadding: EdgeInsets.only(
          //   bottom: bottomPadding ?? 4.5,
          //   left: 12,
          //   top: topPadding ?? 0,
          // ),
          hintText: hintText,
          hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        ),
      ),
    );
  }
}
