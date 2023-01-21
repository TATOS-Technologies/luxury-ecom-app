import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.referFriendText.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Obx(() => controller.isSuccessfully.value
                ? Obx(() => SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonTextPoppins(
                            controller.responseMsg.value,
                            textAlign: TextAlign.center,
                            fontSize: 14.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CommonThemeButton(
                            onTap: () async {
                              FocusScope.of(Get.context!)
                                  .requestFocus(FocusNode());
                              Get.offAndToNamed(
                                  RoutesConstants.dashboardScreen);
                            },
                            title: LanguageConstants.continueShopping.tr,
                          ),
                        ],
                      ),
                    ))
                : GetBuilder<ReferFriendController>(
                    id: "Refer",
                    builder: (controller) {
                      return Column(
                        children: [
                          const SizedBox(height: 100),
                          CommonTextField(
                            height: 40.h,
                            hintText: controller.isValid &&
                                    controller.yourFirstNameController.value
                                            .text ==
                                        ""
                                ? LanguageConstants.enterFirstName.tr
                                : LanguageConstants.firstNameText.tr,
                            controller: controller.yourFirstNameController,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 12),
                          CommonTextField(
                            height: 40.h,
                            hintText: controller.isValid &&
                                    controller.yourEmailController.value.text ==
                                        ""
                                ? LanguageConstants.enterEmailAddress.tr
                                : LanguageConstants.emailAddress.tr,
                            controller: controller.yourEmailController,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 40.h,
                            child: CommonTextPhoneField(
                              textController: controller.yourPhoneController,
                              cursorColor: blackColor,
                              dropdownIconColor: blackColor,
                              fillColor: whiteColor,
                              filled: true,
                              country:
                                  Get.find<CountryController>().country.value,
                              borderColor: borderGrey,
                              focusedColor: borderGrey,
                              errorBorderColor: borderGrey,
                              dropdownTextStyle:
                                  AppTextStyle.textStyleUtils400_12(),
                              fontStyle: AppTextStyle.textStyleUtils400_12(
                                  color: Colors.grey),
                              hintStyle: AppTextStyle.textStyleUtils300_12(
                                  color: Colors.grey),
                              hintText: controller.isValid &&
                                      controller
                                              .yourPhoneController.value.text ==
                                          ""
                                  ? LanguageConstants.enterPhoneNumber.tr
                                  : LanguageConstants.phoneNumberText.tr,
                              onCountryChanged: (country) {
                                controller.countryCode = country.dialCode;
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          CommonTextField(
                            height: 40.h,
                            controller: controller.refFirstNameController,
                            hintText: controller.isValid &&
                                    controller.refFirstNameController.value
                                            .text ==
                                        ""
                                ? LanguageConstants.enterFriendFirstName.tr
                                : LanguageConstants.friendFirstName.tr,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 12),
                          CommonTextField(
                            height: 40.h,
                            controller: controller.refEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: controller.isValid &&
                                    controller.refEmailController.value.text ==
                                        ""
                                ? LanguageConstants.enterFriendEmailAddress.tr
                                : LanguageConstants.friendEmailAddress.tr,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 40.h,
                            child: CommonTextPhoneField(
                              textController: controller.refPhoneController,
                              cursorColor: blackColor,
                              dropdownIconColor: blackColor,
                              borderColor: borderGrey,
                              fillColor: whiteColor,
                              filled: true,
                              country:
                                  Get.find<CountryController>().country.value,
                              focusedColor: borderGrey,
                              errorBorderColor: borderGrey,
                              dropdownTextStyle:
                                  AppTextStyle.textStyleUtils400_12(),
                              fontStyle: AppTextStyle.textStyleUtils400_12(
                                  color: Colors.grey),
                              hintStyle: AppTextStyle.textStyleUtils300_12(
                                  color: Colors.grey),
                              hintText: controller.isValid &&
                                      controller
                                              .refPhoneController.value.text ==
                                          ""
                                  ? LanguageConstants.enterFriendPhoneNumber.tr
                                  : LanguageConstants.friendPhoneNumber.tr,
                              onCountryChanged: (country) {
                                controller.countryCode = country.dialCode;
                              },
                            ),
                          ),
                          const SizedBox(height: 25),
                          CommonThemeButton(
                            onTap: () {
                              FocusScope.of(Get.context!)
                                  .requestFocus(FocusNode());
                              controller.postData();
                            },
                            title: LanguageConstants.register.tr,
                          ),
                        ],
                      );
                    },
                  )),
          ),
        ),
      ),
    );
  }
}
