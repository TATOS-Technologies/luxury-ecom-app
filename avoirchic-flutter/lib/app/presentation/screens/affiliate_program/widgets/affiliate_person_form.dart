import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/profile_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_widget/common_theme_button.dart';
import 'address_part_widget.dart';

class AffiliatePersonForm extends GetView<AffiliateProgramController> {
  const AffiliatePersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: controller.formKey.value,
        child: Column(
          children: [
            ProfilePartWidget(),
            const SizedBox(
              height: 16.0,
            ),
            const AddressPartWidget(),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 35.w,
              width: 120.w,
              child: CommonThemeButton(
                onTap: () {
                  controller.onTap();
                },
                title: LanguageConstants.submitText.tr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
