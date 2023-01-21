import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:veralusso/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/common_text_phone_field.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'checkout_error_text_widget.dart';

class CheckOutAddAddressDialog extends StatelessWidget {
  CheckOutAddAddressDialog({Key? key}) : super(key: key);

  final CheckoutOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        contentPadding:  EdgeInsets.all(20.w),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: whiteColor,
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Form(
                  key: _controller.formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            LanguageConstants.shippingAddressText.tr,
                            style: AppTextStyle.textStyleUtils400(size: 17),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.clear,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  // width: 140,
                                  child: TextFormField(
                                    controller: _controller.firstNameController,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.firstNameController.text == ""
                                        ? LanguageConstants.enterFirstName.tr
                                        : LanguageConstants.firstNameText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(width: 6.0),
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.lastNameController,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.lastNameController.text == ""
                                        ? LanguageConstants.enterLastName.tr
                                        : LanguageConstants.lastNameText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address1Controller,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.address1Controller.text == ""
                                        ? LanguageConstants.enterAddress1.tr
                                        : LanguageConstants.addressOneText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(width: 6.0),
                          Obx(() => Expanded(
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  height: 40.h,
                                  child: TextFormField(
                                    controller: _controller.cityController,
                                    decoration: getInputDecoration(
                                        _controller.isValidation.value == true && _controller.cityController.text == ""
                                            ? LanguageConstants.enterCity.tr
                                            : LanguageConstants.cityText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address2Controller,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.address2Controller.text == ""
                                        ? LanguageConstants.enterAddress2.tr
                                        : LanguageConstants.addressTwoText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(width: 6.0),
                          Obx(
                            () => Expanded(
                              child: Container(
                                height: 40.h,
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 6.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: textFieldBoarderColor,
                                    width: 2,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<CountryListModel>(
                                    // dropdownColor: backGroundColor,
                                    items: _controller.getcountryList
                                        .map((value) => DropdownMenuItem<CountryListModel>(
                                              value: value,
                                              child: Text(value.fullNameEnglish.toString()),
                                            ))
                                        .toList(),
                                    isExpanded: true,
                                    hint: _controller.selectedCoutry1.value.fullNameEnglish.toString() == "null"
                                        ? Text(
                                            LanguageConstants.countryText.tr,
                                            style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                                          )
                                        : Text(
                                            _controller.selectedCoutry1.value.fullNameEnglish.toString(),
                                            style: AppTextStyle.textStyleUtils400(),
                                          ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 28,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    onChanged: (value) {
                                      debugPrint("value Is $value");
                                      _controller.selectedCoutry1.value = value!;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address3Controller,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.address3Controller.text == ""
                                        ? LanguageConstants.enterAddress3.tr
                                        : LanguageConstants.enterAddress3.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(width: 6.0),
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.stateController,
                                    decoration: getInputDecoration(
                                        _controller.isValidation.value == true && _controller.stateController.text == ""
                                            ? LanguageConstants.stateOrProvince.tr
                                            : LanguageConstants.stateText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: textFieldBoarderColor,width: 2)),
                                  child: TextFormField(
                                    controller: _controller.zipPovinceController,
                                    decoration: getInputDecoration(_controller.isValidation.value == true &&
                                            _controller.zipPovinceController.text == ""
                                        ? LanguageConstants.enterZip.tr
                                        : LanguageConstants.postCodeText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        children: [
                          Obx(() => Expanded(
                                child: SizedBox(
                                  height: 40.h,
                                  child: CommonTextPhoneField(
                                    textController: _controller.phoneNumberController,
                                    cursorColor: Colors.black,
                                    country: Get.find<CountryController>().country!.value.toString(),
                                    dropdownIconColor: Colors.black,
                                    borderColor: Colors.black,
                                    dropdownTextStyle: AppTextStyle.textStyleUtils400_16(),
                                    fontStyle: AppTextStyle.textStyleUtils400_16(),
                                    hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
                                    errorBorderColor: Colors.red,
                                    hintText: _controller.isValidation.value == true &&
                                            _controller.phoneNumberController.text == ""
                                        ? LanguageConstants.enterPhoneNumber.tr
                                        : LanguageConstants.phoneNumberText.tr,
                                    onCountryChanged: (country) {
                                      _controller.countryCode = country.dialCode;
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Align(alignment: Alignment.topLeft, child: ErrorTextWidget(_controller.phoneErrorMsg.value)),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _controller.saveAddressBook.value = 0;
                            },
                            child: Container(
                              height: 14,
                              width: 14,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: blackColor,
                                ),
                              ),
                              child: _controller.saveAddressBook.value == 1
                                  ? const Icon(
                                      Icons.check,
                                      color: blackColor,
                                      size: 12,
                                    )
                                  : Container(),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            LanguageConstants.saveInAddressBookText.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonThemeButton(
                            onTap: () {
                              _controller.addAddress();
                            },
                            title:
                              LanguageConstants.shipHereText.tr,

                          ),
                          const SizedBox(width: 10.0),
                          CommonThemeButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title:
                              LanguageConstants.cancelText.tr,

                          ),
                        ],
                      )
                    ],
                  ),
                ),
                _controller.dialogLoaderShow.value ? const ScreenLoading() : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
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
      hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
      border: InputBorder.none,
      isDense: true,
      suffixIcon: null,
    );
  }
}
