import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/profile/profile_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_divider.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import '../../common_widget/common_title_with_arrow.dart';
import '../refer_friend/refer_friend_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);

  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
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
                  CommonDivider(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top + 90.0,
                left: 30.0,
                right: 25.0,
              ),
              child: Obx(
                () => Column(
                  children: [
                    CommonTittleWithArrow(LanguageConstants.myAccountText.tr,
                        onTap: () {
                      Get.to(
                        () => const ReferFriendScreen(),
                      );
                    }),
                    CommonTittleWithArrow(
                      LanguageConstants.myOrdersText.tr,
                    ),
                    CommonTittleWithArrow(
                      LanguageConstants.myWishlistText.tr,
                    ),
                    CommonTittleWithArrow(
                      LanguageConstants.addressBookText.tr,
                    ),
                    CommonTittleWithArrow(
                      LanguageConstants.accountInformationText.tr,
                    ),
                    CommonTittleWithArrow(
                      LanguageConstants.storePaymentText.tr,
                    ),
                    CommonTittleWithArrow(
                      LanguageConstants.news1LetterText.tr,
                    ),
                    CommonTittleWithArrow(
                      "${controller.countryCurrency.value}",
                      onTap: () {
                        Get.toNamed(
                          RoutesConstants.countryScreen,
                        );
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
