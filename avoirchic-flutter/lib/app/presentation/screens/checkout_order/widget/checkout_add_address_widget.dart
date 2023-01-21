import 'package:avoirchic/app/controller/checkout_order_controller.dart';
import 'package:avoirchic/app/controller/country_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_text_phone_field.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/country/country_model.dart';

import '../../../../theme/app_asset.dart';

class CheckOutAddAddressWidget extends StatelessWidget {
  CheckOutAddAddressWidget({Key? key}) : super(key: key);

  final CheckoutOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10.0,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: whiteColor,
      contentWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppAsset.backgroundImage),
            ),
          ),
          width: double.maxFinite,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
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
                            color: Colors.black,
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                // width: 140,
                                child: TextFormField(
                                  controller: _controller.firstNameController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller.isValidation.value == true &&
                                              _controller.firstNameController
                                                      .text == ""
                                          ? LanguageConstants.enterFirstName.tr
                                          : LanguageConstants.firstNameText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.lastNameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: const EdgeInsets.only(
                                      bottom: 10,
                                      top: 12,
                                      left: 10,
                                    ),
                                    hintText: _controller.isValidation.value == true &&
                                            _controller
                                                    .lastNameController.text == ""
                                        ? LanguageConstants.enterLastName.tr
                                        : LanguageConstants.lastNameText.tr,
                                    hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                    border: InputBorder.none,
                                    isDense: true,
                                    suffixIcon: null,
                                  ),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.address1Controller,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller.isValidation.value == true &&
                                              _controller.address1Controller
                                                      .text == ""
                                          ? LanguageConstants.enterAddress1.tr
                                          : LanguageConstants.addressOneText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                            )),
                        const SizedBox(width: 6.0),
                        Obx(() => Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                height: 40.h,
                                child: TextFormField(
                                  controller: _controller.cityController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller
                                                      .isValidation.value == true &&
                                              _controller.cityController.text == ""
                                          ? LanguageConstants.enterCity.tr
                                          : LanguageConstants.cityText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.address2Controller,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller.isValidation.value == true &&
                                              _controller.address2Controller
                                                      .text == ""
                                          ? LanguageConstants.enterAddress2.tr
                                          : LanguageConstants.addressTwoText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                  color: borderGrey,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<CountryListModel>(
                                  items: _controller.getcountryList
                                      .map((value) => DropdownMenuItem<CountryListModel>(
                                            value: value,
                                            child: Text(value.fullNameEnglish
                                                .toString()),
                                          ))
                                      .toList(),
                                  isExpanded: true,
                                  dropdownPadding: null,
                                  hint: _controller.selectedCoutry1.value.fullNameEnglish.toString() == "null"
                                      ? Text(
                                          LanguageConstants.country.tr,
                                          style: AppTextStyle.textStyleUtils400(color: grey636363),
                                        )
                                      : Text(
                                          _controller.selectedCoutry1.value.fullNameEnglish.toString(),
                                          style: AppTextStyle.textStyleUtils400(color: Colors.grey),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.address3Controller,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller.isValidation.value == true &&
                                              _controller.address3Controller
                                                      .text == ""
                                          ? LanguageConstants.enterAddress1.tr
                                          : LanguageConstants.streetAddressText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.stateController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller.isValidation.value == true &&
                                              _controller.stateController.text == ""
                                          ? LanguageConstants.enterStateProvince.tr
                                          : LanguageConstants.stateText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12), border: Border.all(color: borderGrey)),
                                child: TextFormField(
                                  controller: _controller.zipPovinceController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      contentPadding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 12,
                                        left: 10,
                                      ),
                                      hintText: _controller
                                                      .isValidation.value == true &&
                                              _controller.zipPovinceController.text == ""
                                          ? LanguageConstants.enterZip.tr
                                          : LanguageConstants.postCodeText.tr,
                                      hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
                                      isDense: true,
                                      suffixIcon: null,
                                      border: InputBorder.none),
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
                                  dropdownIconColor: borderGrey,
                                  country: Get.find<CountryController>().country!.value.toString(),
                                  borderColor: borderGrey,
                                  focusedColor: borderGrey,
                                  dropdownTextStyle: AppTextStyle.textStyleUtils400_16(),
                                  fontStyle:
                                      AppTextStyle.textStyleUtils400_16(),
                                  hintStyle: AppTextStyle.textStyleUtils400_16(color: grey636363),
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
                    const SizedBox(height: 14.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.saveAddressBook.value = 0;
                          },
                          child: Container(
                            height: 15,
                            width: 15,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.black,
                            )),
                            child: _controller.saveAddressBook.value == 1
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 14,
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          LanguageConstants.saveInAddressBookText.tr,
                          style: AppTextStyle.textStyleUtils500(color: Colors.black54),
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
                          onTap: () {
                            _controller.addAddress();
                          },
                          title: LanguageConstants.shipHereText.tr,
                        ),
                        const SizedBox(width: 10.0),
                        CommonThemeButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: LanguageConstants.cancelText.tr,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
