// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

import '../../../controller/product_detail/product_detail_controller.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import '../../../theme/colors.dart';

class CreateTicketForBestPriceMatchDialog extends StatelessWidget {
  CreateTicketForBestPriceMatchDialog({
    Key? key,
    required this.onTap,
    required this.phoneNumberController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.urlOfImageController,
    required this.remarksController,
    required this.keywordController,
    required this.isProductAvailableController,
    required this.priceController,
    required this.productNameController,
    required this.linkCheaperProductController,
    required this.styleController,
    required this.urlOfWebsiteController,
  }) : super(key: key);
  final Function() onTap;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController urlOfImageController;
  final TextEditingController remarksController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController productNameController;
  final TextEditingController styleController;
  final TextEditingController keywordController;
  final TextEditingController urlOfWebsiteController;
  final TextEditingController linkCheaperProductController;
  final TextEditingController priceController;
  final TextEditingController isProductAvailableController;

  final ProductDetailController productDetailController = Get.find();
  String? countryCode = "1";

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: backGroundColor,
      radius: 30,
      contentWidget: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Center(
                      child: Text(
                    LanguageConstants.priceMatchTicket.tr,
                    style: AppTextStyle.textStyleUtils400(size: 18),
                  )),
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.close,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: firstNameController,
                          keyboardType: TextInputType.number,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getInputDecoration(LanguageConstants.firstNameText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterFirstName.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: lastNameController,
                          keyboardType: TextInputType.number,
                          style: AppTextStyle.textStyleUtils300_12(),
                          readOnly: true,
                          decoration: getInputDecoration(LanguageConstants.lastName.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterLastName.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Flexible(
                  child: SizedBox(
                    height: 40,
                    child: TextFormField(
                      cursorColor: Colors.black,
                      style: AppTextStyle.textStyleUtils300_12(),
                      controller: emailController,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backGroundColor,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                        hintText: LanguageConstants.email.tr,
                        hintStyle: AppTextStyle.textStyleUtils300_12(),
                        labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 40,
                  child: CommonTextPhoneField(
                    textController: phoneNumberController,
                    cursorColor: blackColor,
                    country: Get.find<CountryController>().country.value,
                    dropdownIconColor: Colors.black,
                    borderColor: Colors.black,
                    focusedColor: Colors.black,
                    dropdownTextStyle: AppTextStyle.textStyleUtils400_12(),
                    fontStyle: AppTextStyle.textStyleUtils400_12(),
                    hintStyle: AppTextStyle.textStyleUtils400_12(),
                    errorBorderColor: Colors.red,
                    hintText: LanguageConstants.enterPhoneNumber.tr,
                    onCountryChanged: (country) {
                      countryCode = country.dialCode;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: productNameController,
                          keyboardType: TextInputType.number,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getInputDecoration(LanguageConstants.productName.tr),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: styleController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getInputDecoration(LanguageConstants.enterStyle.tr),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: keywordController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getBlackInputDecoration(LanguageConstants.enterKeyword.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterURLOfImage.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: urlOfImageController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getBlackInputDecoration(LanguageConstants.urlOfImage.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterURLOfImage.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: urlOfWebsiteController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getBlackInputDecoration(LanguageConstants.websiteUrlForItemCheaper.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterUrlText.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: linkCheaperProductController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getBlackInputDecoration(LanguageConstants.linkForItemCheaper.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterLink.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: priceController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils300_12(),
                          decoration: getBlackInputDecoration(LanguageConstants.priceIncludingDutiesAndTaxes.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterPriceText.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        LanguageConstants.countryWhereYouShipped.tr,
                        style: AppTextStyle.textStyleUtils400_12(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: isProductAvailableController,
                          keyboardType: TextInputType.text,
                          decoration: getBlackInputDecoration(LanguageConstants.isProductAvailableInWebsite.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterYesOrNo.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: appColorAccent,
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(color: Colors.black, width: 0),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<CountryListModel>(
                              dropdownColor: backGroundColor,
                              items: productDetailController.getCountryListData
                                  .map((value) => DropdownMenuItem<CountryListModel>(
                                        value: value,
                                        child: Text(
                                          value.fullNameEnglish.toString(),
                                          style: AppTextStyle.textStyleUtils400_12(),
                                        ),
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: productDetailController.selectedCountry.value.fullNameEnglish.toString() == "null"
                                  ? Text(
                                      LanguageConstants.country.tr,
                                      style: AppTextStyle.textStyleUtils400_12(color: Colors.black54),
                                    )
                                  : Text(
                                      productDetailController.selectedCountry.value.fullNameEnglish.toString(),
                                      style: AppTextStyle.textStyleUtils400_12(),
                                    ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                debugPrint("value Is $value");
                                productDetailController.selectedCountry.value = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    style: AppTextStyle.textStyleUtils300_12(),
                    controller: remarksController,
                    keyboardType: TextInputType.text,
                    decoration: getBlackInputDecoration(LanguageConstants.enterRemarks.tr),
                    validator: (value) {
                      if (value == null || value == '') {
                        return LanguageConstants.enterURLOfImage.tr;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: appColorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: onTap,
                child: HeadlineBodyOneBaseWidget(
                  title: LanguageConstants.createTicket.tr,
                  titleColor: Colors.white,
                  fontFamily: AppConstants.fontPoppins,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: backGroundColor,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils300_12(color: Colors.grey),
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 0,
        ),
      ),
    );
  }

  InputDecoration getBlackInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: backGroundColor,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils300_12(),
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      errorStyle: AppTextStyle.textStyleUtils400(color: Colors.red),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 0,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: appColor,
        ),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }
}
