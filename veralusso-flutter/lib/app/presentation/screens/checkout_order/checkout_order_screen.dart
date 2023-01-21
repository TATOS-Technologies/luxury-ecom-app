import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'widget/check_out_widget.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  final dynamic cartlist = Get.arguments;
  @override
  final CheckoutOrderController controller = Get.find();

  CheckoutOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppbar(title: LanguageConstants.checkoutText.tr),
        body: Stack(children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 10.0,
            ),
            child: Form(
              key: controller.formKey,
              child: const CheckOutWidget(),
            ),
          ),
          controller.isLoading.value ? const ScreenLoading() : Container(),
        ]),
      ),
    );
  }

  void showDialogAddress(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10.0,
            ),
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            contentWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      LanguageConstants.shippingAddressText.tr,
                      style: AppTextStyle.textStyleUtilsUnderLine18(fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40, // width: 140,
                        child: TextFormField(
                          controller: controller.firstNameController,
                          decoration: getInputDecoration(LanguageConstants.firstNameText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterFirstName.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: 140,
                        child: TextFormField(
                          controller: controller.lastNameController,
                          decoration: getInputDecoration(LanguageConstants.lastNameText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterLastName.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.address1Controller,
                          decoration: getInputDecoration(LanguageConstants.stLine1.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.streetAdd1Text.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.cityController,
                          decoration: getInputDecoration(LanguageConstants.cityText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterCity.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.address2Controller,
                          decoration: getInputDecoration(LanguageConstants.stLine2.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterAddress2.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: Container(
                        height: 40.0,
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 6.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: Colors.black.withOpacity(
                                0.6,
                              ),
                              width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<CountryListModel>(
                            //
                            items: controller.getcountryList
                                .map((value) => DropdownMenuItem<CountryListModel>(
                                      value: value,
                                      child: Text(value.fullNameEnglish.toString()),
                                    ))
                                .toList(),
                            isExpanded: true,
                            hint: controller.selectedCoutry1.value.fullNameEnglish.toString() == "null"
                                ? Text(
                                    LanguageConstants.countryText.tr,
                                    style: AppTextStyle.textStyleUtils400(),
                                  )
                                : Text(
                                    controller.selectedCoutry1.value.fullNameEnglish.toString(),
                                    style: AppTextStyle.textStyleUtils400(),
                                  ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 28,
                              color: Colors.black.withOpacity(
                                0.2,
                              ),
                            ),
                            onChanged: (value) {
                              debugPrint("value Is $value");
                              controller.selectedCoutry1.value = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.address3Controller,
                          decoration: getInputDecoration(LanguageConstants.stLine3.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterAddress3.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.stateController,
                          decoration: getInputDecoration(LanguageConstants.stateText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return "${LanguageConstants.enterStateProvince.tr}";
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.zipPovinceController,
                          decoration: getInputDecoration(LanguageConstants.zipCodeText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return LanguageConstants.enterZip.tr;
                            }
                            return '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: CommonTextPhoneField(
                          textController: controller.phoneNumberController,
                          textColor: darkGrey,
                          cursorColor: blue,
                          dropdownIconColor: darkGrey,
                          borderColor: darkGrey,
                          focusedColor: darkGrey,
                          errorBorderColor: red,
                          dropdownTextStyle: AppTextStyle.textStyleUtils400_16(color: darkGrey),
                          fontStyle: AppTextStyle.textStyleUtils400_16(color: darkGrey),
                          hintStyle: AppTextStyle.textStyleUtils400_16(color: darkGrey),
                          hintText: LanguageConstants.phoneNumberText.tr,
                          hintColor: appColor,
                          onCountryChanged: (country) {
                            controller.countryCode = country.dialCode;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.saveAddressBook.value = 0;
                      },
                      child: Container(
                        height: 18,
                        width: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        child: controller.saveAddressBook.value == 1
                            ? const Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 16,
                              )
                            : Container(),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      LanguageConstants.saveInAddressBookText.tr,
                      style: AppTextStyle.textStyleUtils500(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.addAddress();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        LanguageConstants.shipHereText.tr,
                        style: AppTextStyle.textStyleUtils400(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        LanguageConstants.cancelText.tr,
                        style: AppTextStyle.textStyleUtils400(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(
        bottom: 10,
        top: 12,
        left: 10,
      ),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils400(),
      errorStyle: AppTextStyle.textStyleUtils400(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.6),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.6),
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        borderSide: const BorderSide(
          color: blackColor,
        ),
      ),
      isDense: true,
      suffixIcon: null,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.6),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
