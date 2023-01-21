import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressPartWidget extends GetView<AffiliateProgramController> {
  const AddressPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstants.addressText.tr,
          titleColor: titleColor,
          titleTextAlign: TextAlign.center,
          underline: true,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Obx(
              () => Expanded(
                child: Container(
                  height: 40.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(
                        color: borderGrey,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        onChanged: (String? value) {
                          controller.selectedVisitorValue.value =
                              value.toString();
                        },
                        icon: Image.asset(AppAsset.downArrow,
                            height: 16, width: 16.0),
                        value: controller.selectedVisitorValue.value,
                        items: <String>[
                          LanguageConstants.visitorMonthHintText.tr,
                          LanguageConstants.lessThen500Text.tr,
                          LanguageConstants.fiveHundredToThousandText.tr,
                          LanguageConstants.over500Text.tr,
                        ]
                            .map(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: HeadlineBodyOneBaseWidget(
                                  title: value,
                                  fontSize: 14,
                                  titleColor: grey636363,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Obx(() => Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: borderGrey,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.selectedViewsValue.value =
                                value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.selectedViewsValue.value,
                          items: <String>[
                            LanguageConstants.viewsMonthHintText.tr,
                            LanguageConstants.lessThen500Text.tr,
                            LanguageConstants.fiveHundredToThousandText.tr,
                            LanguageConstants.over500Text.tr,
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                    titleColor: grey636363,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: TextFormFieldWidget(
                  controller: controller.addressOneController.value,
                  focusNode: controller.addressOneFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.addressOneController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterAddress1.tr
                      : LanguageConstants.addressOneText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: TextFormFieldWidget(
                  controller: controller.addressTwoController.value,
                  focusNode: controller.addressTwoFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.addressTwoController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterAddress2.tr
                      : LanguageConstants.addressTwoText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
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
                height: 40.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: borderGrey,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
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
                                titleColor: grey636363,
                              ),
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
                height: 40.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: borderGrey,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String? value) {
                        controller.countryValue.value = value.toString();
                      },
                      icon: Image.asset(AppAsset.downArrow,
                          height: 16, width: 16.0),
                      value: controller.countryValue.value,
                      style: AppTextStyle.textStyleUtils400(),
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
                                titleColor: grey636363,
                                fontFamily: AppConstants.fontPoppins,
                              ),
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
                height: 40.h,
                child: TextFormFieldWidget(
                  controller: controller.postCodeController.value,
                  focusNode: controller.postCodeFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.postCodeController.value.text == "" &&
                          controller.isValidation
                      ? LanguageConstants.enterZipOrProvince.tr
                      : LanguageConstants.postCodeText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                  validator: (value) {
                    return null;
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
