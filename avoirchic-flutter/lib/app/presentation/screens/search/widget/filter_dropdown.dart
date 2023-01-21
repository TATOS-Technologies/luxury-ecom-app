import 'dart:ui';

import 'package:avoirchic/app/controller/search_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterDropDown extends GetView<SearchController> {
  const FilterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        controller: controller.txtList,
        autofocus: false,
        textAlign: TextAlign.left,
        cursorColor: blackColor,
        cursorHeight: 20,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.grey.shade300,
            size: 20.w,
          ),
          contentPadding: const EdgeInsets.only(bottom: 14),
          hintText: LanguageConstants.searchText.tr,
          hintStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(12)),
        ),
        onChanged: (val) {
          controller.searchTextFieldOnChange(val);
        },
      ),
    );
  }
}
