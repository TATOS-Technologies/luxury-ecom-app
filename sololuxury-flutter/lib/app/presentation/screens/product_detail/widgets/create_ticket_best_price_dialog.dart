import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/controller/product_detail/product_detail_controller.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/theme/colors.dart';

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
  final GestureTapCallback? onTap;
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

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: const Color(0xFFF9EAE3),
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
                      style: AppStyle.textStyleUtils400(
                        size: 18.0,
                        color: appColor,
                      ),
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
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.close,
                        size: 22,
                        color: appColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: firstNameController,
                          keyboardType: TextInputType.number,
                          decoration: getAppColorInputDecoration(LanguageConstants.firstNameText.tr),
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
                          readOnly: true,
                          decoration: getAppColorInputDecoration(LanguageConstants.lastNameText.tr),
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: emailController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: backGroundColor,
                            contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                            hintText: LanguageConstants.email.tr,
                            labelStyle: AppStyle.textStyleUtils400(color: Colors.black54),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                          ),
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
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          decoration: getInputDecoration(LanguageConstants.phoneNumberText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterPhoneNumber.tr;
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: productNameController,
                          keyboardType: TextInputType.number,
                          decoration: getAppColorInputDecoration(LanguageConstants.productName.tr),
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
                          decoration: getAppColorInputDecoration(LanguageConstants.enterStyle.tr),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: keywordController,
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(LanguageConstants.enterKeyword.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterURLOfImage;
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
                          decoration: getInputDecoration(LanguageConstants.urlOfImage.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterURLOfImage;
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: urlOfWebsiteController,
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(LanguageConstants.websiteUrlForItemCheaper.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterUrlText;
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
                          decoration: getInputDecoration(LanguageConstants.linkForItemCheaper.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterLink;
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: priceController,
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(LanguageConstants.priceIncludingDutiesAndTaxes.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterPriceText;
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
                        LanguageConstants.countryWhereYouWantItShipped.tr,
                        style: AppStyle.textStyleUtils400_12(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: isProductAvailableController,
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(LanguageConstants.isProductAvailableInWebsite.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterYesOrNo;
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
                                      style: AppStyle.textStyleUtils400(color: Colors.black54),
                                    )
                                  : Text(
                                      productDetailController.selectedCountry.value.fullNameEnglish.toString(),
                                      style: AppStyle.textStyleUtils400(color: Colors.black),
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: remarksController,
                    keyboardType: TextInputType.text,
                    decoration: getInputDecoration(LanguageConstants.enterRemarks.tr),
                    validator: (value) {
                      if (value == null || value == '') {
                        return LanguageConstants.enterURLOfImage;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                        decoration: BoxDecoration(color: appColor, borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          LanguageConstants.createTicket.tr,
                          style: AppStyle.textStyleUtils500_16(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back<dynamic>();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                        decoration: BoxDecoration(color: appColor, borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          LanguageConstants.cancelText.tr,
                          style: AppStyle.textStyleUtils500_16(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: backGroundColor,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: message,
      labelStyle: AppStyle.textStyleUtils400(color: Colors.black54),
      errorStyle: AppStyle.textStyleUtils400(color: Colors.red),
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
          width: 1.0,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(0.0),
      ),
    );
  }

  InputDecoration getAppColorInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: backGroundColor,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: message,
      labelStyle: AppStyle.textStyleUtils400(color: Colors.black54),
      errorStyle: AppStyle.textStyleUtils400(color: Colors.red),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1.0,
        ),
      ),
    );
  }
}
