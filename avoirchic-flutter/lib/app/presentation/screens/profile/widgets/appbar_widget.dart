import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/profile_controller.dart';
import '../../../common_widgets/common_widget/common_divider.dart';
import '../../../common_widgets/common_widget/common_text_poppins.dart';

class AppBarWidget extends GetView<ProfileController> {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(Get.context!).viewPadding.top + 15.0,
      ),
      child: Column(
        children: [
          CommonTextPoppins(
            LanguageConstants.myAccountText.tr,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
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
