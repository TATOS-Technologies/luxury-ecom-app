import 'package:brandslabels/app/controller/contact_us_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: LanguageConstants.contactUsText.tr),
      body: SingleChildScrollView(
        child: GetBuilder<ContactUsController>(
          id: "Contact",
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Text(
                      LanguageConstants.orderenquiriesText.tr,
                      style: AppTextStyle.textStyleUtilsUnderLine18(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      LanguageConstants
                          .whateverYourQueryUseTheContactFormBelowMsg.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400(
                              color: Colors.black54, size: 12.5)
                          .copyWith(
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: TextFormFieldWidget(
                        controller: controller.nameController,
                        hintText: controller.isValid &&
                                controller.nameController.value.text == ""
                            ? LanguageConstants.enterName.tr
                            : LanguageConstants.firstNameText.tr,
                        hintStyle: AppTextStyle.textStyleUtils400(),
                        validator: (value) => Validators.validateName(value),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: TextFormFieldWidget(
                                  controller: controller.surnameController,
                                  hintText: controller.isValid &&
                                          controller.surnameController.value
                                                  .text ==
                                              ""
                                      ? LanguageConstants.enterSurname.tr
                                      : LanguageConstants.surNameText.tr,
                                  hintStyle: AppTextStyle.textStyleUtils400(),
                                  validator: (value) =>
                                      Validators.validateName(value),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      child: EmailWidget(
                        controller: controller.emailController,
                        hintText: controller.isValid &&
                                controller.emailController.value.text == ""
                            ? LanguageConstants.enterEmailAddress.tr
                            : LanguageConstants.emailText.tr,
                        hintStyle: AppTextStyle.textStyleUtils400(),
                        validator: (value) => Validators.validateEmail(value),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      child: EmailWidget(
                        controller: controller.confirmEmailController,
                        hintText: controller.isValid &&
                                controller.confirmEmailController.value.text ==
                                    ""
                            ? LanguageConstants.enterConfirmEmailAddress
                            : LanguageConstants.confirmEmailAddressText.tr,
                        hintStyle: AppTextStyle.textStyleUtils400(),
                        validator: (value) => Validators.validateConfirmEmail(
                            value, controller.emailController.text),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(() => Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: textfieldBorderGrey,
                                        width: 2,
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        dropdownColor: Colors.white,
                                        icon: const Icon(
                                            Icons.expand_more_outlined,
                                            color: blackColor),
                                        value: controller
                                                .chosenTypeOfEnquiryValue
                                                .value
                                                .isEmpty
                                            ? null
                                            : controller
                                                .chosenTypeOfEnquiryValue.value,
                                        elevation: 2,
                                        style: AppTextStyle.textStyleUtils400(),
                                        items: controller.data
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(value),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          LanguageConstants
                                              .typeOfEnquiryText.tr,
                                          style:
                                              AppTextStyle.textStyleUtils400(),
                                        ),
                                        onChanged: (String? value) {
                                          if (value !=
                                              LanguageConstants
                                                  .typeOfEnquiryText.tr) {
                                            controller.chosenTypeOfEnquiryValue
                                                .value = value!;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: CommonTextPhoneField(
                                  textController: controller.phoneController,
                                  cursorColor: regularGrey,
                                  dropdownIconColor: Colors.black,
                                  borderColor:
                                      controller.phoneErrorMsg.value.isEmpty
                                          ? textfieldBorderGrey
                                          : Colors.red,
                                  focusedColor: textfieldBorderGrey,
                                  country: controller
                                      .countryController.country.value,
                                  dropdownTextStyle:
                                      AppTextStyle.textStyleUtils400(),
                                  fontStyle: AppTextStyle.textStyleUtils400(),
                                  hintStyle: AppTextStyle.textStyleUtils400(),
                                  errorBorderColor: Colors.red,
                                  hintText: controller.isValid &&
                                          controller
                                                  .phoneController.value.text ==
                                              ""
                                      ? LanguageConstants.enterPhoneNumber.tr
                                      : LanguageConstants.phoneNumberText.tr,
                                  onCountryChanged: (country) {
                                    controller.countryCode = country.dialCode;
                                  },
                                  validator: (value) =>
                                      Validators.validateMobile(
                                          value?.number ?? ''),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(
                          color: textfieldBorderGrey,
                          width: 2,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          style: AppTextStyle.textStyleUtils400(),
                          icon: const Icon(Icons.expand_more_outlined,
                              color: appColor),
                          value: controller.chosenCountry.value.isEmpty
                              ? null
                              : controller.chosenCountry.value,
                          elevation: 2,
                          items: controller.countryController.storeWebsitesList
                              .map((item) {
                            return DropdownMenuItem(
                                value: item.name.toString(),
                                child: Text(
                                  item.name ?? '',
                                  //Names that the api dropdown contains
                                  style: AppTextStyle.textStyleUtils400(),
                                ) //Id that has to be passed that the dropdown has.....
                                //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                );
                          }).toList(),
                          hint: Text(LanguageConstants.countryText.tr),
                          onChanged: (String? value) {
                            controller.chosenCountry.value = value!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      child: TextFormFieldWidget(
                        controller: controller.subjectController,
                        hintText: LanguageConstants.subjectText.tr,
                        hintStyle: AppTextStyle.textStyleUtils400(),
                        validator: (value) => Validators.validateRequired(
                            value ?? '', LanguageConstants.subjectText.tr),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldWidget(
                          controller: controller.onYourMindController,
                          maxLines: 5,
                          hintText: LanguageConstants.whatsonyourmindText.tr,
                          hintStyle: AppTextStyle.textStyleUtils400(),
                          validator: (value) => Validators.validateRequired(
                              value ?? '',
                              LanguageConstants.whatsonyourmindText.tr),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 45.h,
                      width: 327.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.contactUsPost(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: darkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: CommonTextOpenSans(
                          LanguageConstants.submitText.tr,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
