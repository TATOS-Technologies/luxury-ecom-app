import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/meta_package.dart';
import 'package:solo_luxury/app/theme/colors.dart';
import 'package:solo_luxury/app/core/const/app_constants.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? keyboardInputAction;
  final FormFieldValidator<String>? validator;
  final bool? isValidationShow;
  final Border? textFieldBorder;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? borderColor;

  const CommonTextField(
      {Key? key,
      this.hintText,
      this.controller,
      this.width,
      this.keyboardType,
      this.focusNode,
      this.keyboardInputAction,
      this.validator,
      this.isValidationShow = true,
      this.textFieldBorder,
      this.textAlign = TextAlign.left,
      this.textColor = Colors.black,
      this.borderColor = appColorButton,
      this.fontFamily = AppConstants.fontOpenSans,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: width ?? MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          border: textFieldBorder ?? Border.all(color: borderColor!)),
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          textInputAction: keyboardInputAction,
          textAlign: textAlign!,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(
                r'(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|\ud83c[\ude32-\ude3a]|\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])')),
            LengthLimitingTextInputFormatter(100), // for mobile
          ],
          validator: isValidationShow!
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return '*${LanguageConstants.requiredVal.tr}';
                  }
                  return null;
                }
              : null,
          style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: fontWeight,
              fontFamily: fontFamily),
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: appTileBGcolor,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              // contentPadding: EdgeInsets.zero,
              hintText: hintText ?? '',
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: textColor,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily))),
    );
  }
}
