import 'package:brandslabels/app/controller/product_detail_controller.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:brandslabels/app/theme/colors.dart';
import '../../../../core/utils/lang_directory/language_constant.dart';

class CreateTicketForBestPriceMatchDialog extends StatelessWidget {
  CreateTicketForBestPriceMatchDialog({
    Key? key,
    required this.onTap,
    required this.formKey,
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
  final GlobalKey<FormState> formKey;

  final ProductDetailController productDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: regularF5F5F5,
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
                          style: AppTextStyle.textStyleUtils300(),
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
                          style: AppTextStyle.textStyleUtils300(),
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
                      style: AppTextStyle.textStyleUtils300(),
                      controller: emailController,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                        hintText: LanguageConstants.email.tr,
                        hintStyle: AppTextStyle.textStyleUtils300(color: Colors.grey),
                        labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
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
                    dropdownTextStyle: AppTextStyle.textStyleUtils400(color: Colors.black),
                    fontStyle: AppTextStyle.textStyleUtils400(color: Colors.black),
                    hintStyle: AppTextStyle.textStyleUtils400(),
                    errorBorderColor: Colors.red,
                    hintText: LanguageConstants.enterPhoneNumber.tr,
                    onCountryChanged: (country) {
                      // countryCode = country.dialCode;
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
                          style: AppTextStyle.textStyleUtils300(),
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
                          style: AppTextStyle.textStyleUtils300(),
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
                          style: AppTextStyle.textStyleUtils300(),
                          decoration: getInputDecoration(LanguageConstants.enterKeyword.tr),
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
                          style: AppTextStyle.textStyleUtils300(),
                          decoration: getInputDecoration(LanguageConstants.urlOfImage.tr),
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
                          style: AppTextStyle.textStyleUtils300(),
                          decoration:
                              getInputDecoration(LanguageConstants.websiteUrlForItemCheaper.tr),
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
                          style: AppTextStyle.textStyleUtils300(),
                          decoration: getInputDecoration(LanguageConstants.linkForItemCheaper.tr),
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
                          style: AppTextStyle.textStyleUtils300(),
                          decoration:
                              getInputDecoration(LanguageConstants.priceIncludingDutiesAndTaxes.tr),
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
                        style: AppTextStyle.textStyleUtils400(),
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
                          decoration:
                              getInputDecoration(LanguageConstants.isProductAvailableInWebsite.tr),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<CountryListModel>(
                              dropdownColor: Colors.white,
                              items: productDetailController.getCountryListData
                                  .map((value) => DropdownMenuItem<CountryListModel>(
                                        value: value,
                                        child: Text(
                                          value.fullNameEnglish.toString(),
                                          style: AppTextStyle.textStyleUtils400(),
                                        ),
                                      ))
                                  .toList(),
                              isExpanded: true,
                              hint: productDetailController.selectedCountry.value.fullNameEnglish
                                          .toString() ==
                                      "null"
                                  ? Text(
                                      LanguageConstants.country.tr,
                                      style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                                    )
                                  : Text(
                                      productDetailController.selectedCountry.value.fullNameEnglish
                                          .toString(),
                                      style: AppTextStyle.textStyleUtils400(),
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
                    style: AppTextStyle.textStyleUtils300(),
                    controller: remarksController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                      hintText: LanguageConstants.enterRemarks.tr,
                      hintStyle: AppTextStyle.textStyleUtils300(color: Colors.grey),
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
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
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
              ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.createTicket.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
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
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils300(
        color: Colors.grey,
      ),
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: appColor,
          width: 1,
        ),
      ),
    );
  }
}
