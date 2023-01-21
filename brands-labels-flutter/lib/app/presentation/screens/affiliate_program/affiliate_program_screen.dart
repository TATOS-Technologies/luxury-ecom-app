import 'package:brandslabels/app/controller/affiliate_program_controller.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/behaviour.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/utils/validator.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  const AffiliateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: commonAppbar(
              title: LanguageConstants.affiliateProgramTitleText.tr),
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).padding.top,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 10,
                      ),
                      lookingForWidget(context: context),
                      expectForWidget(context: context),
                      promoteForWidget(context: context),
                      applyForWidget(context: context),
                      affiliatePersonForm(context: context),
                    ],
                  ),
                ),
              ),
              //appBarWidget(controller),
            ],
          ),
        ));
  }

  Widget bulletSentence({required BuildContext context, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeadlineBodyOneBaseWidget(
          title: "•",
          titleColor: Colors.black,
          titleTextAlign: TextAlign.start,
          fontSize: 14.0,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Expanded(
          child: HeadlineBodyOneBaseWidget(
            title: text,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.start,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget lookingForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.whoAreWeLookingTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.whoAreWeLookingDescriptionOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget expectForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.whatCanYouExpectTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                bulletSentence(
                    context: context,
                    text: LanguageConstants.expectRuleOneText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.expectRuleTwoText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.expectRuleThreeText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.expectRuleFourText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.expectRuleFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget promoteForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.promoteSoloQuestionText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                bulletSentence(
                    context: context,
                    text: LanguageConstants.promoteSoloAnswerOneText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.promoteSoloAnswerTwoText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.promoteSoloAnswerThreeText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.promoteSoloAnswerFourText.tr),
                bulletSentence(
                    context: context,
                    text: LanguageConstants.promoteSoloAnswerFiveText.tr),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget applyForWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineBodyOneBaseWidget(
            title: LanguageConstants.howApplyTitleText.tr,
            titleColor: Colors.black,
            titleTextAlign: TextAlign.center,
            underline: true,
            fontSize: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.howApplyAnswerOneText.tr,
                  titleColor: Colors.black,
                  titleTextAlign: TextAlign.start,
                  fontSize: 14.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget affiliatePersonForm({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: controller.formKey.value,
        child: GetBuilder<AffiliateProgramController>(
          id: "affi",
          builder: (controller) {
            return Column(
              children: [
                profilePartWidget(context: context),
                const SizedBox(
                  height: 16.0,
                ),
                addressPartWidget(context: context),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 45.h,
                  width: 327.w,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.onTap();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
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
                SizedBox(
                  height: 40.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget profilePartWidget({required BuildContext context}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineBodyOneBaseWidget(
            title: LanguageConstants.profile.tr,
            titleColor: titleColor,
            titleTextAlign: TextAlign.left,
            fontWeight: FontWeight.w500,
            // underline: true,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 45.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: textfieldBorderGrey, width: 2)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    onChanged: (String? value) {
                      controller.selectedValue.value = value.toString();
                    },
                    icon: Image.asset(AppAsset.downArrow,
                        height: 16, width: 16.0),
                    style: const TextStyle(
                        color: Colors.grey,
                        fontFamily: AppConstants.fontPoppins),
                    itemHeight: 50,
                    value: controller.selectedValue.value,
                    items: <String>[
                      LanguageConstants.mr.tr,
                      LanguageConstants.mrs.tr
                    ]
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: HeadlineBodyOneBaseWidget(
                              title: value,
                              fontSize: 14,
                              titleColor: Colors.grey,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    controller: controller.firstNameController.value,
                    focusNode: controller.focusNode.value,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: controller.isValidation &&
                              controller.firstNameController.value.text == ""
                          ? LanguageConstants.enterFirstName.tr
                          : LanguageConstants.firstNameText.tr,
                      hintStyle: const TextStyle(
                          fontSize: 15, fontFamily: AppConstants.fontPoppins),
                    ),
                    validator: (value) {
                      return Validators.validateName(value);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          child: TextFormFieldWidget(
            controller: controller.lastNameController.value,
            focusNode: controller.lastNameFocusNode.value,
            hintText: controller.isValidation &&
                    controller.lastNameController.value.text == ""
                ? LanguageConstants.enterLastName.tr
                : LanguageConstants.lastNameText.tr,
            hintStyle: AppTextStyle.textStyleUtils400(size: 15),
            validator: (value) {
              return Validators.validateName(value);
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.emailController.value,
                  focusNode: controller.emailFocusNode.value,
                  keyboardType: TextInputType.emailAddress,
                  hintText: controller.isValidation &&
                          controller.emailController.value.text == ""
                      ? LanguageConstants.enterEmailAddress.tr
                      : LanguageConstants.emailText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                  validator: (value) {
                    return Validators.validateEmail(value);
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: CommonTextPhoneField(
                  textController: controller.contactNoController.value,
                  cursorColor: regularGrey,
                  dropdownIconColor: Colors.black,
                  country: Get.find<CountryController>().country.value,
                  borderColor: controller.phoneErrorMsg.value.isEmpty
                      ? textfieldBorderGrey
                      : Colors.red,
                  focusedColor: blackColor,
                  dropdownTextStyle: AppTextStyle.textStyleUtils400(
                    color: Colors.black,
                  ),
                  fontStyle: AppTextStyle.textStyleUtils400(
                    color: Colors.black,
                  ),
                  hintStyle: AppTextStyle.textStyleUtils400(),
                  errorBorderColor: Colors.red,
                  hintText: controller.isValidation &&
                          controller.contactNoController.value.text == ""
                      ? LanguageConstants.enterPhoneNumber.tr
                      : LanguageConstants.contactNoText.tr,
                  onCountryChanged: (country) {
                    controller.countryCode = country.dialCode;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.websiteController.value,
                  focusNode: controller.websiteNoFocusNode.value,
                  hintText: controller.isValidation &&
                          controller.websiteController.value.text == ""
                      ? LanguageConstants.enterWebsite.tr
                      : LanguageConstants.websiteUrlText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                  validator: (value) {
                    return Validators.validateRequired(
                        value ?? '', LanguageConstants.websiteUrlText.tr);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget addressPartWidget({required BuildContext context}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: HeadlineBodyOneBaseWidget(
            title: LanguageConstants.addressText.tr,
            titleColor: titleColor,
            titleTextAlign: TextAlign.left,
            fontWeight: FontWeight.w500,
            // underline: true,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textfieldBorderGrey, width: 2))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.selectedVisitorValue.value =
                            value.toString();
                      },
                      style: AppTextStyle.textStyleUtils400(),
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.selectedVisitorValue.value,
                      items: <String>[
                        LanguageConstants.visitorMonthHintText.tr,
                        LanguageConstants.mr.tr,
                        LanguageConstants.mrs.tr
                      ]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontSize: 14,
                                  fontFamily: AppConstants.fontPoppins,
                                  titleColor: Colors.grey),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textfieldBorderGrey, width: 2))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.selectedViewsValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      style: AppTextStyle.textStyleUtils400(),
                      value: controller.selectedViewsValue.value,
                      items: <String>[
                        LanguageConstants.viewsMonthHintText.tr,
                        LanguageConstants.mr.tr,
                        LanguageConstants.mrs.tr
                      ]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontFamily: AppConstants.fontPoppins,
                                  fontSize: 14,
                                  titleColor: Colors.grey),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.addressOneController.value,
                  focusNode: controller.addressOneFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValidation &&
                          controller.addressOneController.value.text == ""
                      ? LanguageConstants.enterAddress1.tr
                      : LanguageConstants.addressOneText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                  validator: (value) {
                    return Validators.validateAddress(
                        value ?? '', LanguageConstants.addressOneText.tr);
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.addressTwoController.value,
                  focusNode: controller.addressTwoFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValidation &&
                          controller.addressTwoController.value.text == ""
                      ? LanguageConstants.enterAddress2.tr
                      : LanguageConstants.addressTwoText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                  validator: (value) {
                    return Validators.validateAddress(
                        value ?? '', LanguageConstants.addressTwoText.tr);
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textfieldBorderGrey, width: 2))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                      onChanged: (String? value) {
                        controller.cityValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.cityValue.value,
                      items: <String>[
                        LanguageConstants.cityHintText.tr,
                        LanguageConstants.mr.tr,
                        LanguageConstants.mrs.tr
                      ]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontSize: 14,
                                  titleColor: Colors.grey),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textfieldBorderGrey, width: 2))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                      onChanged: (String? value) {
                        controller.countryValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.countryValue.value,
                      items: <String>[
                        LanguageConstants.countryHintText.tr,
                        LanguageConstants.mr.tr,
                        LanguageConstants.mrs.tr
                      ]
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontSize: 14,
                                  titleColor: Colors.grey),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                child: TextFormFieldWidget(
                  controller: controller.postCodeController.value,
                  focusNode: controller.postCodeFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValidation &&
                          controller.postCodeController.value.text == ""
                      ? LanguageConstants.enterPostCode.tr
                      : LanguageConstants.postCodeText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(size: 15),
                  validator: (value) {
                    return Validators.validateAddress(
                        value ?? '', LanguageConstants.addressOneText.tr);
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }
}
