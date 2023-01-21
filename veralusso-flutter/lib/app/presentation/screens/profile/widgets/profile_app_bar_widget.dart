import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/profile/profile_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_divider.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';

class ProfileAppbarWidget extends GetView<ProfileController> {
  const ProfileAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(Get.context!).viewPadding.top + 15.0),
      child: Column(
        children: [
          CommonTextMontserrat(
            LanguageConstants.myAccountText.tr,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CommonDivider(),
        ],
      ),
    );
  }
}
