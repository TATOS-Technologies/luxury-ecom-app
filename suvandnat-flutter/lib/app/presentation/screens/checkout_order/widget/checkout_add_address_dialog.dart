import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:suvandnat/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:suvandnat/app/controller/country/country_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class CheckOutAddAddressDialog extends StatelessWidget {
  CheckOutAddAddressDialog({Key? key}) : super(key: key);

  final CheckoutOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        contentPadding: EdgeInsets.all(20.w),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: backGroundColor,
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Form(
                  key: _controller.loginAddressFormKey,
                  child: GetBuilder<CheckoutOrderController>(
                    id: "checkOut",
                    builder: (_controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            LanguageConstants.shippingAddressText.tr,
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.firstNameController,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller
                                                    .firstNameController.text ==
                                                ""
                                        ? LanguageConstants.enterFirstName.tr
                                        : LanguageConstants.firstNameText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.lastNameController,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller
                                                    .lastNameController.text ==
                                                ""
                                        ? LanguageConstants.enterLastName.tr
                                        : LanguageConstants.lastNameText.tr),
                                    validator: (value) {
                                      return null;
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
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address1Controller,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller
                                                    .address1Controller.text ==
                                                ""
                                        ? LanguageConstants.enterAddress1.tr
                                        : LanguageConstants.addressOneText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Expanded(
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.cityController,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller.cityController.text ==
                                                ""
                                        ? LanguageConstants.enterCity.tr
                                        : LanguageConstants.cityText.tr),
                                    validator: (value) {
                                      return null;
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
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address2Controller,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller
                                                    .address2Controller.text ==
                                                ""
                                        ? LanguageConstants.enterAddress2.tr
                                        : LanguageConstants.addressTwoText.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Expanded(
                                child: Container(
                                  height: 40.h,
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 6.0),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: borderGrey,
                                      width: 2,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CountryListModel>(
                                      dropdownColor: backGroundColor,
                                      items: _controller.getcountryList
                                          .map((value) => DropdownMenuItem<
                                                  CountryListModel>(
                                                value: value,
                                                child: Text(value
                                                    .fullNameEnglish
                                                    .toString()),
                                              ))
                                          .toList(),
                                      isExpanded: true,
                                      hint: _controller.selectedCoutry1.value
                                                  .fullNameEnglish ==
                                              null
                                          ? Text(
                                              LanguageConstants.countryText.tr,
                                              style: AppTextStyle
                                                  .textStyleUtils400(
                                                      color: Colors.grey),
                                            )
                                          : Text(
                                              _controller.selectedCoutry1.value
                                                  .fullNameEnglish
                                                  .toString(),
                                              style: AppTextStyle
                                                  .textStyleUtils400(
                                                      color: Colors.black),
                                            ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 28,
                                        color: appColor.withOpacity(0.2),
                                      ),
                                      onChanged: (value) {
                                        _controller.countryOnChanged(value);
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
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    controller: _controller.address3Controller,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller
                                                    .address3Controller.text ==
                                                ""
                                        ? LanguageConstants.enterAddress3.tr
                                        : LanguageConstants.enterAddress3.tr),
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6.0),
                              Expanded(
                                child: _controller.selectedStateList1.isNotEmpty
                                    ? Container(
                                        height: 40.h,
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 6.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: borderGrey,
                                            width: 2,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child:
                                              DropdownButton<AvailableRegion>(
                                            dropdownColor: whiteColor,
                                            items: _controller
                                                .selectedStateList1
                                                .map(
                                                  (value) => DropdownMenuItem<
                                                      AvailableRegion>(
                                                    value: value,
                                                    child: Text(
                                                      value.name ?? '',
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            isExpanded: true,
                                            hint: _controller.selectedState1
                                                        .value.name ==
                                                    null
                                                ? Text(
                                                    LanguageConstants
                                                        .stateText.tr,
                                                    style: AppTextStyle
                                                        .textStyleUtils400_12(
                                                            color: Colors.grey),
                                                  )
                                                : Text(
                                                    _controller.selectedState1
                                                            .value.name ??
                                                        '',
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            color:
                                                                Colors.black),
                                                  ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 28,
                                              color:
                                                  brownColor.withOpacity(0.2),
                                            ),
                                            onChanged: (value) {
                                              _controller.stateOnChanged(value);
                                            },
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: borderGrey, width: 2)),
                                        child: TextFormField(
                                          controller:
                                              _controller.stateController,
                                          decoration: getInputDecoration(
                                              _controller.isValidation &&
                                                      _controller
                                                              .stateController
                                                              .text ==
                                                          ""
                                                  ? LanguageConstants
                                                      .stateOrProvince.tr
                                                  : LanguageConstants
                                                      .stateText.tr),
                                          validator: (value) {
                                            return null;
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
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: borderGrey, width: 2)),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller:
                                        _controller.zipPovinceController,
                                    decoration: getInputDecoration(_controller
                                                .isValidation &&
                                            _controller.zipPovinceController
                                                    .text ==
                                                ""
                                        ? LanguageConstants.enterZip.tr
                                        : LanguageConstants.postCodeText.tr),
                                    validator: (value) {
                                      return null;
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
                                  height: 40.h,
                                  child: CommonTextPhoneField(
                                    textController:
                                        _controller.phoneNumberController,
                                    cursorColor: blue,
                                    country: Get.find<CountryController>()
                                        .country
                                        .value,
                                    dropdownIconColor: appColor,
                                    borderColor: borderGrey,
                                    focusedColor: borderGrey,
                                    fillColor: whiteColor,
                                    filled: true,
                                    dropdownTextStyle:
                                        AppTextStyle.textStyleUtils400_12(),
                                    fontStyle:
                                        AppTextStyle.textStyleUtils400_12(),
                                    hintStyle:
                                        AppTextStyle.textStyleUtils400_12(
                                            color: Colors.grey),
                                    hintText: _controller.isValidation &&
                                            _controller.phoneNumberController
                                                    .text ==
                                                ""
                                        ? LanguageConstants.enterPhoneNumber.tr
                                        : LanguageConstants.phoneNumberText.tr,
                                    onCountryChanged: (country) {
                                      _controller.countryCode =
                                          country.dialCode;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child:
                                    _controller.phoneErrorMsg.value.isNotEmpty
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: CommonTextOpenSans(
                                              _controller.phoneErrorMsg.value,
                                              fontSize: 12,
                                              textAlign: TextAlign.left,
                                              color: Colors.black,
                                            ),
                                          )
                                        : const SizedBox.shrink()),
                          ),
                          const SizedBox(height: 14.0),
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
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: _controller.saveAddressBook.value == 1
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.black,
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
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonThemeButton(
                                  onTap: () async {
                                    _controller.addAddress();
                                  },
                                  title: LanguageConstants.shipHere.tr),
                              const SizedBox(width: 10.0),
                              CommonThemeButton(
                                onTap: () async {
                                  Get.back();
                                },
                                title: LanguageConstants.cancelText.tr,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
                _controller.dialogLoaderShow.value
                    ? const ScreenLoading()
                    : const SizedBox.shrink()
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
        hintStyle: AppTextStyle.textStyleUtils400_12(color: Colors.grey),
        isDense: true,
        suffixIcon: null,
        border: InputBorder.none);
  }
}
