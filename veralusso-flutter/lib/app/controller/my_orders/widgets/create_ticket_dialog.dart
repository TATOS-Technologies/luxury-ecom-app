import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_constants.dart';

import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:meta_package/translations/translations.dart';

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

  final MyOrdersController myOrdersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: whiteColor,
      radius: 30,
      contentWidget: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      '${LanguageConstants.orderNotEligible.tr} ${fromReturn ? LanguageConstants.returnText.tr : LanguageConstants.cancelText.tr}. ${LanguageConstants.createSupportTicketAssistance.tr}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: AppConstants.fontMontserrat),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: firstNameController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.firstNameText.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: orderController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.orderIdText.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
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
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: lastNameController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.lastName.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: skuController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.sku.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
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
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: emailController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.email.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: orderCancelController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.orderCancelRequest.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
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
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: textFieldBoarderColor, width: 2)),
                            child: TextFormField(
                              cursorColor: blackColor,
                              controller: imageUrlController,
                              keyboardType: TextInputType.text,
                              readOnly: fromItem,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                  ),
                                  hintText: LanguageConstants.urlOfImage.tr,
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  errorStyle: const TextStyle(color: Colors.red),
                                  border: InputBorder.none),
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
                            child: CommonTextPhoneField(
                              textController: myOrdersController.phoneNumberController,
                              cursorColor: blackColor,
                              country: Get.find<CountryController>().country!.value.toString(),
                              dropdownIconColor: blackColor,
                              borderColor: blackColor,
                              focusedColor: blackColor,
                              errorBorderColor: blackColor,
                              dropdownTextStyle: const TextStyle(color: blackColor, fontSize: 14),
                              fontStyle: const TextStyle(color: blackColor, fontSize: 14),
                              hintStyle: const TextStyle(
                                  color: blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontMontserrat),
                              hintText: LanguageConstants.phoneNumberText.tr,
                              hintColor: blackColor,
                              onCountryChanged: (country) {
                                myOrdersController.countryCode = country.dialCode;
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
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: textFieldBoarderColor, width: 2)),
                      child: TextFormField(
                        cursorColor: blackColor,
                        controller: remarksController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              bottom: 10,
                              top: 10,
                              left: 10,
                            ),
                            hintText: LanguageConstants.enterRemarks.tr,
                            labelStyle: const TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterURLOfImage.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  CommonThemeButton(
                    isOutLined: true,
                    buttonColor: whiteColor,
                    textColor: blackColor,
                    onTap: onTap,
                    title: LanguageConstants.createTicket.tr,
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
              Obx(
                () => myOrdersController.dialogLoader.value
                    ? const ScreenLoading()
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
