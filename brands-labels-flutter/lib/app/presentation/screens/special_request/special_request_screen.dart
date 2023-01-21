import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/controller/special_request_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: buttonColor,
        ),
        title:
            CommonTextPoppins(controller.getHeaderString(), color: buttonColor),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
            ),
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(24.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      nameTextField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      lastNameField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      emailField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      phoneNumberField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      brandNameField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      styleField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      keywordField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      imageUrlField(),
                      SizedBox(
                        height: 15.h,
                      ),
                      remarkField(),
                      SizedBox(
                        height: 30.h,
                      ),
                      submitAccountButton(
                        context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: appBarPrimary,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget nameTextField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.nameController,
              hintText: controller.nameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.firstNameIsRequired.tr
                  : LanguageConstants.firstNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget lastNameField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.lastNameController,
              hintText: controller.lastNameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.lastNameIsRequired.tr
                  : LanguageConstants.lastNameText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget emailField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.emailController,
              hintText: controller.emailController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.emailRequired.tr
                  : LanguageConstants.emailAddreessText.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget phoneNumberField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: CommonTextPhoneField(
              borderRadius: BorderRadius.circular(12),
              textController: controller.phoneNumberController,
              cursorColor: regularGrey,
              dropdownIconColor: Colors.grey.shade500,
              borderColor: Colors.grey.shade400,
              focusedColor: Colors.grey.shade400,
              country: Get.find<CountryController>().country.value,
              dropdownTextStyle: AppTextStyle.textStyleUtils400(),
              fontStyle: AppTextStyle.textStyleUtils400(),
              hintStyle: AppTextStyle.textStyleUtils400(color: regularGrey),
              hintText: controller.phoneNumberController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.phoneNumberIsRequired.tr
                  : LanguageConstants.phoneNumberText.tr,
              onCountryChanged: (country) {
                controller.countryCode = country.dialCode;
              },
            ),
          );
        });
  }

  Widget brandNameField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.brandNameController,
              hintText: controller.brandNameController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.brandNameIsRequired.tr
                  : LanguageConstants.brandName.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget styleField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.styleController,
              hintText: controller.styleController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.styleIsRequired.tr
                  : LanguageConstants.style.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget keywordField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.keywordController,
              hintText: controller.keywordController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.keywordIsRequired.tr
                  : LanguageConstants.keyword.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget imageUrlField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.imageUrlController,
              hintText: controller.imageUrlController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.imageUrlIsRequired.tr
                  : LanguageConstants.imageURL.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget remarkField() {
    return GetBuilder<SpecialRequestController>(
        id: "Create",
        builder: (c) {
          return SizedBox(
            child: TextFormFieldWidget(
              maxLines: 1,
              controller: controller.remarkController,
              hintText: controller.remarkController.text == "" &&
                      controller.isValidation
                  ? LanguageConstants.remarkIsRequired.tr
                  : LanguageConstants.remark.tr,
              hintStyle: AppTextStyle.textStyleUtils400(),
              validator: (value) => null,
            ),
          );
        });
  }

  Widget submitAccountButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: 327.w,
        height: 46.h,
        child: ElevatedButton(
          onPressed: () {
            controller.contactUsPost(context);
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
          ),
          child: CommonTextPoppins(
            LanguageConstants.submitText.tr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
