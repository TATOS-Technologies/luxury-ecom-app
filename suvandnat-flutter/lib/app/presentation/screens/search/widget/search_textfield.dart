import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/search/search_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class SearchTextField extends GetView<SearchController> {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: TextFormField(
        controller: controller.txtList,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            bottom: 12,
            top: 12,
            left: 12,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            size: 25,
            color: Colors.grey.shade300,
          ),
          border: InputBorder.none,
          hintText: LanguageConstants.searchText.tr,
          hintStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
        ),
        onChanged: (val) {
          controller.onSearchChange(val);
        },
      ),
    );
  }
}
