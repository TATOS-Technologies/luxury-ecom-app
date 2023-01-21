import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/controller/refer_friend_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: LanguageConstants.referFriendText.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Obx(() => controller.isSuccessfully.value
              ? successfully()
              : GetBuilder<ReferFriendController>(
                  id: "Refer",
                  builder: (controller) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        CommonTextPoppins(
                          LanguageConstants.enterDetailsBelowToSend.tr,
                          textAlign: TextAlign.center,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          height: 1.4,
                        ),
                        SizedBox(height: 20.h),
                        nameTextField(),
                        SizedBox(height: 15.h),
                        emailTextField(),
                        SizedBox(height: 15.h),
                        phoneTextField(),
                        SizedBox(height: 15.h),
                        friendFirstNameTextField(),
                        SizedBox(height: 15.h),
                        friendEmailTextField(),
                        SizedBox(height: 15.h),
                        friendPhoneTextField(),
                        SizedBox(height: 25.h),
                        registerButton(),
                      ],
                    );
                  },
                )),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return SizedBox(
      
      child: CommonTextField(
        textColor: Colors.grey,
        textFieldBorder: Border.all(color: Colors.black),
        hintText: controller.isValidation &&
                controller.yourFirstNameController.value.text == ""
            ? LanguageConstants.enterFirstName.tr
            : LanguageConstants.firstNameText.tr,
        controller: controller.yourFirstNameController,
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget emailTextField() {
    return SizedBox(
      
      child: CommonTextField(
        textColor: Colors.grey,
        textFieldBorder: Border.all(color: Colors.black),
        hintText: controller.isValidation &&
                controller.yourEmailController.value.text == ""
            ? LanguageConstants.enterEmailAddress.tr
            : LanguageConstants.emailAddress.tr,
        controller: controller.yourEmailController,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget phoneTextField() {
    return SizedBox(
      
      child: CommonTextPhoneField(
        textController: controller.yourPhoneController,
        cursorColor: Colors.black,
        dropdownIconColor: Colors.black,
        borderColor: textfieldBorderGrey,
        focusedColor: textfieldBorderGrey,
        country: Get.find<CountryController>().country.value,
        dropdownTextStyle: AppTextStyle.textStyleUtils400_12(),
        fontStyle: AppTextStyle.textStyleUtils400_12(),
        hintStyle: AppTextStyle.textStyleUtils400_12(color: Colors.grey),
        errorBorderColor: Colors.red,
        hintText: controller.isValidation &&
                controller.yourPhoneController.value.text == ""
            ? LanguageConstants.enterPhoneNumber.tr
            : LanguageConstants.enterPhoneNumber.tr,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
      ),
    );
  }

  Widget friendFirstNameTextField() {
    return SizedBox(
      
      child: CommonTextField(
        textColor: Colors.grey,
        textFieldBorder: Border.all(color: Colors.black),
        controller: controller.refFirstNameController,
        keyboardType: TextInputType.name,
        hintText: controller.isValidation &&
                controller.refFirstNameController.value.text == ""
            ? LanguageConstants.enterFriendName.tr
            : LanguageConstants.friendFirstName.tr,
      ),
    );
  }

  Widget friendEmailTextField() {
    return CommonTextField(
      textColor: Colors.grey,
      textFieldBorder: Border.all(color: Colors.black),
      controller: controller.refEmailController,
      keyboardType: TextInputType.emailAddress,
      hintText: controller.isValidation &&
              controller.refEmailController.value.text == ""
          ? LanguageConstants.enterFirstEmailAddress.tr
          : LanguageConstants.friendEmailAddress.tr,
    );
  }

  Widget friendPhoneTextField() {
    return SizedBox(
      
      child: CommonTextPhoneField(
        textController: controller.refPhoneController,
        cursorColor: Colors.black,
        dropdownIconColor: Colors.black,
        borderColor:
            controller.phoneErrorMsg.value.isEmpty ? textfieldBorderGrey : Colors.red,
        focusedColor: textfieldBorderGrey,
        country: Get.find<CountryController>().country.value,
        dropdownTextStyle: AppTextStyle.textStyleUtils400_12(),
        fontStyle: AppTextStyle.textStyleUtils400_12(),
        hintStyle: AppTextStyle.textStyleUtils400_12(color: Colors.grey),
        errorBorderColor: Colors.red,
        hintText: controller.isValidation &&
                controller.refPhoneController.value.text == ""
            ? LanguageConstants.enterFirstPhoneNumber.tr
            : LanguageConstants.friendPhoneNumber.tr,
        onCountryChanged: (country) {
          controller.countryFriendCode = country.dialCode;
        },
      ),
    );
  }

  Widget registerButton() {
    return SizedBox(
      height: 45.w,
      width: 327.w,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          controller.postData();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CommonTextOpenSans(
          LanguageConstants.register.tr,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
      ),
    );
  }

  Widget successfully() {
    return Obx(() => SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextPoppins(
                controller.responseMsg.value,
                textAlign: TextAlign.center,
                fontSize: 14.0,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAndToNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ));
  }
}
