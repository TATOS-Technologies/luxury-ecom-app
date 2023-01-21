import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/controller/product_detail_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

// ignore: must_be_immutable
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
    required this.productDetailController,
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

  final ProductDetailController productDetailController;
  bool isValidation = false;
  String countryCode = "1";

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      radius: 30,
      contentWidget: SingleChildScrollView(
        child: Container(
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
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 22,
                        color: avoirChickTheme,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                        child: TextFormField(
                          cursorColor: avoirChickTheme,
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
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
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(LanguageConstants.lastNameText.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterLastName.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                    child: TextFormField(
                      cursorColor: avoirChickTheme,
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration(LanguageConstants.specialSizeEnterEmailText.tr),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterEmailAddress.tr;
                        }
                        return null;
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  height: 40,
                  child: CommonTextPhoneField(
                    textController: phoneNumberController,
                    cursorColor: Colors.black,
                    dropdownIconColor: Colors.black,
                    country: Get.find<CountryController>().country?.value.toString(),
                    borderColor: Colors.black,
                    focusedColor: avoirChickTheme,
                    dropdownTextStyle: AppTextStyle.textStyleUtils400_16(),
                    fontStyle: AppTextStyle.textStyleUtils400_16(),
                    hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                    errorBorderColor: Colors.red,
                    hintText: isValidation == true && phoneNumberController.text == ""
                        ? LanguageConstants.enterPhoneNumber.tr
                        : LanguageConstants.phoneNumberText.tr,
                    onCountryChanged: (country) {
                      countryCode = country.dialCode;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                        child: TextFormField(
                          cursorColor: avoirChickTheme,
                          controller: productNameController,
                          keyboardType: TextInputType.text,
                          style: AppTextStyle.textStyleUtils400_12(),
                          decoration: getInputDecoration(LanguageConstants.productName.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterProductName.tr;
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
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: styleController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400_12(),
                        decoration: getInputDecoration(LanguageConstants.enterStyle.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterStyleName.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: keywordController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.enterKeyword.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterKeyword.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: urlOfImageController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.urlOfImage.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterURLOfImage.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: urlOfWebsiteController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.websiteUrlForItemCheaper.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterURLOfImage.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: linkCheaperProductController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.linkForItemCheaper.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterLinkToCheaperProduct.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: priceController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.priceIncludingDutiesAndTaxes.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterPriceIncludingDuties.tr;
                          }
                          return null;
                        },
                      ),
                    )),
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
                        child: Container(
                      height: 40,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                      child: TextFormField(
                        cursorColor: avoirChickTheme,
                        controller: isProductAvailableController,
                        keyboardType: TextInputType.text,
                        style: AppTextStyle.textStyleUtils400(),
                        decoration: getInputDecoration(LanguageConstants.isProductAvailableInWebsite.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterIsProductAvailableOnWebsite.tr;
                          }
                          return null;
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<CountryListModel>(
                              dropdownColor: backGroundColor,
                              items: productDetailController.getCountryListData
                                  .map((value) => DropdownMenuItem<CountryListModel>(
                                        value: value,
                                        child: Text(value.fullNameEnglish.toString()),
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: productDetailController.selectedCountry.value.fullNameEnglish.toString() == "null"
                                  ? Text(
                                      LanguageConstants.country.tr,
                                      style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                                    )
                                  : Text(
                                      productDetailController.selectedCountry.value.fullNameEnglish.toString(),
                                      style: AppTextStyle.textStyleUtils400(color: Colors.black),
                                    ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: avoirChickTheme,
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
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black), color: Colors.transparent),
                    child: TextFormField(
                      cursorColor: avoirChickTheme,
                      controller: remarksController,
                      keyboardType: TextInputType.text,
                      style: AppTextStyle.textStyleUtils400(),
                      decoration: getInputDecoration(LanguageConstants.enterRemarks.tr),
                      validator: (value) {
                        if (value == null || value == '') {
                          return LanguageConstants.enterRemarks.tr;
                        }
                        return null;
                      },
                    ),
                  )),
              const SizedBox(height: 18.0),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 7.0,
                  ),
                  decoration: BoxDecoration(
                    color: avoirChickTheme,
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: Text(
                    LanguageConstants.createTicket.tr,
                    style: AppTextStyle.textStyleUtils500_16(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hint,
        hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        border: InputBorder.none);
  }
}
