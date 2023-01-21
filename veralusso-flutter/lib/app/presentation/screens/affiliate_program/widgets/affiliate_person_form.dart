import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';
import 'address_part_widget.dart';
import 'profile_part_widget.dart';

class AffiliatePersonForm extends StatelessWidget {
  const AffiliatePersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: GetBuilder<AffiliateProgramController>(
        id: "affi",
        builder: (controller) {
          return Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: controller.formKey.value,
            child: Column(
              children: [
                ProfilePartWidget(),
                const SizedBox(
                  height: 16.0,
                ),
                AddressPartWidget(),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 45.h,
                  width: 327.w,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onTap();
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
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
