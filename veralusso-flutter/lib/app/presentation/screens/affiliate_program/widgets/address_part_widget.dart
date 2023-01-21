import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class AddressPartWidget extends GetView<AffiliateProgramController> {
  @override
  final AffiliateProgramController controller = Get.find();

  AddressPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadlineBodyOneBaseWidget(
          title: LanguageConstants.addressText.tr,
          titleColor: Colors.black,
          titleTextAlign: TextAlign.center,
          fontSize: 16.0,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45.w,
                child: TextFormFieldWidget(
                  controller: controller.addressOneController.value,
                  focusNode: controller.addressOneFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValid &&
                          controller.addressOneController.value.text == ""
                      ? LanguageConstants.enterAddress1.tr
                      : LanguageConstants.addressOneText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
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
                height: 45.w,
                child: TextFormFieldWidget(
                  controller: controller.addressTwoController.value,
                  focusNode: controller.addressTwoFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintText: controller.isValid &&
                          controller.addressTwoController.value.text == ""
                      ? LanguageConstants.enterAddress2.tr
                      : LanguageConstants.addressTwoText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(),
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
                height: 45.w,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textFieldBoarderColor, width: 2))),
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
                                titleColor: Colors.grey,
                                fontSize: 14,
                                fontFamily: AppConstants.fontMontserrat,
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
                height: 45.w,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: textFieldBoarderColor, width: 2))),
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
                                titleColor: Colors.grey,
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
              flex: 1,
              child: SizedBox(
                height: 45.w,
                child: TextFormFieldWidget(
                  controller: controller.postCodeController.value,
                  focusNode: controller.postCodeFocusNode.value,
                  keyboardType: TextInputType.streetAddress,
                  hintStyle: AppTextStyle.textStyleUtils400(),
                  hintText: controller.isValid &&
                          controller.postCodeController.value.text == ""
                      ?LanguageConstants.enterZipPostalCode.tr
                      : LanguageConstants.postCodeText.tr,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
