import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/profile_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_divider.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_routes.dart';
import '../refer_friend/refer_friend_screen.dart';

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
            appBarWidget(),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(Get.context!).viewPadding.top + 90.0,
                  left: 30.0,
                  right: 25.0),
              child: Obx(
                () => Column(
                  children: [
                    titleWithArrow(LanguageConstants.myAccountText.tr,
                        onTap: () {
                      Get.to(() => const ReferFriendScreen());
                    }),
                    titleWithArrow(LanguageConstants.myOrdersText.tr),
                    titleWithArrow(LanguageConstants.myWishlistText.tr),
                    titleWithArrow(LanguageConstants.addressBookText.tr),
                    titleWithArrow(LanguageConstants.accountInformationText.tr),
                    titleWithArrow(LanguageConstants.storePaymentText.tr),
                    titleWithArrow(LanguageConstants.newsLetter1Text.tr),
                    titleWithArrow(
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

  Widget appBarWidget() {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(Get.context!).viewPadding.top + 15.0),
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
          const CommonDivider(
            color: appBarPrimary,
          ),
        ],
      ),
    );
  }

  Widget titleWithArrow(String? title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextPoppins(
              title ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: Center(
                child: Image.asset(
                  AppAsset.rightIcon,
                  height: 10.0,
                  width: 10.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
