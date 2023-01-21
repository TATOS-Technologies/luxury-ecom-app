import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CreateTicketDialog extends StatelessWidget {
  CreateTicketDialog({
    Key? key,
    required this.onTap,
    this.fromItem = false,
    this.fromReturn = false,
    required this.phoneNumberController,
    required this.firstNameController,
    required this.lastNameController,
    required this.skuController,
    required this.orderCancelController,
    required this.emailController,
    required this.orderController,
    required this.imageUrlController,
    required this.remarksController,
  }) : super(key: key);
  final Function() onTap;
  final TextEditingController phoneNumberController;
  final TextEditingController firstNameController;
  final bool fromItem;
  final bool fromReturn;

  final TextEditingController lastNameController;
  final TextEditingController skuController;
  final TextEditingController orderCancelController;
  final TextEditingController emailController;
  final TextEditingController orderController;
  final TextEditingController imageUrlController;
  final TextEditingController remarksController;
  String countryCode = '1';
  RxString phoneErrorMsg = "".obs;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      radius: 30,
      contentWidget: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.close,
                        size: 22,
                        color: avoirChickTheme,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  '${LanguageConstants.orderNotEligible.tr} ${fromReturn ? LanguageConstants.returnText.tr : LanguageConstants.cancelText.tr}.${LanguageConstants.createSupportTicketAssistance.tr}',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(),
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
                          cursorColor: avoirChickTheme,
                          controller: firstNameController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: getInputDecoration(
                              LanguageConstants.firstNameText.tr),
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
                          cursorColor: avoirChickTheme,
                          controller: orderController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: getInputDecoration(
                              LanguageConstants.orderIdText.tr),
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
                          cursorColor: avoirChickTheme,
                          controller: lastNameController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: getInputDecoration(
                              LanguageConstants.lastNameText.tr),
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
                          cursorColor: avoirChickTheme,
                          controller: skuController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration:
                              getInputDecoration(LanguageConstants.sku.tr),
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
                          cursorColor: avoirChickTheme,
                          controller: emailController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: getInputDecoration(
                              LanguageConstants.emailText.tr),
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
                          cursorColor: avoirChickTheme,
                          controller: orderCancelController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: getInputDecoration(
                              LanguageConstants.orderCancelRequest.tr),
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
                        child: CommonTextPhoneField(
                          filled: true,
                          fillColor: Colors.transparent,
                          textController: phoneNumberController,
                          cursorColor: blue,
                          country: Get.find<CountryController>().country!.value,
                          dropdownIconColor: Colors.black,
                          borderColor: Colors.black,
                          focusedColor: Colors.black,
                          dropdownTextStyle:
                              AppTextStyle.textStyleUtils400_16(),
                          fontStyle: AppTextStyle.textStyleUtils400_16(),
                          hintStyle: AppTextStyle.textStyleUtils400_16(),
                          errorBorderColor: Colors.red,
                          hintText: LanguageConstants.phoneNumberText.tr,
                          onCountryChanged: (country) {
                            countryCode = country.dialCode;
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
                          cursorColor: avoirChickTheme,
                          controller: imageUrlController,
                          keyboardType: TextInputType.text,
                          readOnly: fromItem,
                          decoration: getInputDecorationNew(
                              LanguageConstants.urlOfImage.tr),
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
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    cursorColor: avoirChickTheme,
                    controller: remarksController,
                    keyboardType: TextInputType.text,
                    decoration: getInputDecorationNew(
                        LanguageConstants.enterRemarks.tr),
                    validator: (value) {
                      if (value == null || value == '') {
                        return LanguageConstants.enterURLOfImage.tr;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 7.0),
                  decoration: BoxDecoration(
                      color: avoirChickTheme,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    LanguageConstants.createTicket.tr,
                    style:
                        AppTextStyle.textStyleUtils500_16(color: Colors.white),
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
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
      labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
  }

  InputDecoration getInputDecorationNew(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      hintText: hint,
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
}
