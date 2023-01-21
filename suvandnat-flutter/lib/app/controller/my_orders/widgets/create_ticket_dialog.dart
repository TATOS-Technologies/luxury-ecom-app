import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/controller/my_orders/my_orders_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../presentation/common_widget/screen_loading.dart';

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
      backgroundColor: backGroundColor,
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
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      '${LanguageConstants.orderNotEligible.tr} ${fromReturn ? LanguageConstants.returnText.tr : LanguageConstants.cancelText.tr}. ${LanguageConstants.createSupportTicketAssistance.tr}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontFamily: AppConstants.fontPoppins),
                    ),
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
                              cursorColor: appColor,
                              controller: firstNameController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.firstNameText.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
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
                              cursorColor: appColor,
                              controller: orderController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.orderIdText.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
                                  ),
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
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              cursorColor: appColor,
                              controller: lastNameController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.lastName.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
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
                              cursorColor: appColor,
                              controller: skuController,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.sku.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
                                  ),
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
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              cursorColor: appColor,
                              controller: emailController,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.email.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
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
                              cursorColor: appColor,
                              controller: orderCancelController,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.orderCancelRequest.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
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
                                    color: Colors.black,
                                  ),
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
                    child: Row(
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              cursorColor: appColor,
                              controller: imageUrlController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: AppConstants.fontPoppins),
                              readOnly: fromItem,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: backGroundColor,
                                contentPadding: const EdgeInsets.only(
                                  bottom: 10,
                                  top: 10,
                                  left: 10,
                                ),
                                hintText: LanguageConstants.urlOfImage.tr,
                                hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppConstants.fontPoppins),
                                labelStyle: const TextStyle(color: Colors.black54),
                                errorStyle: const TextStyle(color: Colors.red),
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
                              fillColor: backGroundColor,
                              textController: phoneNumberController,
                              fontStyle: const TextStyle(fontSize: 12, fontFamily: AppConstants.fontPoppins),
                              hintStyle: const TextStyle(fontSize: 12, color: regularGrey),
                              cursorColor: blue,
                              dropdownIconColor: Colors.black,
                              dropdownTextStyle: const TextStyle(
                                  fontFamily: AppConstants.fontPoppins, fontSize: 16, color: blackColor),
                              borderColor: Colors.black,
                              country: Get.find<CountryController>().country.value,
                              borderRadius: const BorderRadius.all(Radius.circular(0)),
                              hintText: LanguageConstants.phoneNumberText.tr,
                              onCountryChanged: (country) {
                                // countryCode = country.dialCode;
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
                        cursorColor: appColor,
                        controller: remarksController,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontFamily: AppConstants.fontPoppins),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: backGroundColor,
                          contentPadding: const EdgeInsets.only(
                            bottom: 10,
                            top: 10,
                            left: 10,
                          ),
                          hintText: LanguageConstants.enterRemarks.tr,
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: AppConstants.fontPoppins),
                          labelStyle: const TextStyle(color: Colors.black54),
                          errorStyle: const TextStyle(color: Colors.red),
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
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 7.0,
                        ),
                        decoration: BoxDecoration(
                          color: red973133,
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        child: Text(
                          LanguageConstants.createTicket.tr,
                          style: const TextStyle(
                            fontFamily: AppConstants.fontPoppins,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
              Obx(
                () => myOrdersController.dialogLoader.value ? const ScreenLoading() : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
