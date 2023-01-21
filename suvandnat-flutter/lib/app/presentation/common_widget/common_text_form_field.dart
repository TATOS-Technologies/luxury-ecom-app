// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../core/const/app_constants.dart';
import '../../theme/colors.dart';

class CommonTextFormField extends StatelessWidget {
  String? hintText;
  double? height;
  double? bottomPadding;
  double? topPadding;
  FormFieldValidator<String>? validation;
  TextEditingController? controller;

  CommonTextFormField(
      {this.hintText,
      this.height,
      this.bottomPadding,
      this.topPadding,
      this.validation,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        validator: validation,
        cursorColor: blackColor,
        style: const TextStyle(
          fontFamily: AppConstants.fontPoppins,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              bottom: bottomPadding ?? 10, left: 12, top: topPadding ?? 0),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: AppConstants.fontPoppins,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
      alignment: Alignment.center,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderGrey,
          width: 2,

        ),
      ),
    );
  }
}
