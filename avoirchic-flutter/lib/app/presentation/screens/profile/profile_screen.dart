import 'package:avoirchic/app/presentation/screens/profile/widgets/appbar_widget.dart';
import 'package:avoirchic/app/presentation/screens/profile/widgets/title_with_arrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/lang_directory/language_constant.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const AppBarWidget(),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top + 90.0,
                left: 30.0,
                right: 25.0,
              ),
              child: Obx(
                () => Column(
                  children: [
                    TitleWithArrow(LanguageConstants.myAccountText.tr,
                        onTap: () {
                      Get.toNamed(RoutesConstants.referFriendScreen);
                    }),
                    TitleWithArrow(LanguageConstants.myOrdersText.tr),
                    TitleWithArrow(LanguageConstants.myWishlistText.tr),
                    TitleWithArrow(LanguageConstants.addressBookText.tr),
                    TitleWithArrow(LanguageConstants.accountInformationText.tr),
                    TitleWithArrow(LanguageConstants.storePaymentText.tr),
                    TitleWithArrow(LanguageConstants.newsLetterText.tr),
                    TitleWithArrow(
                      controller.countryCurrency.value,
                      onTap: () {
                        Get.toNamed(RoutesConstants.countryScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
