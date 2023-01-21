import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/api/models/country/country_model.dart';
import 'package:solo_luxury/app/controller/checkout_order/checkout_order_controller.dart';
import 'package:solo_luxury/app/controller/country/country_controller.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_phone_field.dart';
import 'package:solo_luxury/app/presentation/common_widget/screen_loading.dart';
import 'package:solo_luxury/app/presentation/screens/refer_friend/widget/error_text_widget.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class CheckOutAddAddressDialog extends StatelessWidget {
  CheckOutAddAddressDialog({Key? key}) : super(key: key);

  final CheckoutOrderController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.w,
        ),
        insetPadding: EdgeInsets.symmetric(
          horizontal: 15.sp,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        radius: 20,
        backgroundColor: homeBackground,
        contentWidget: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Form(
                    key: _controller.formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(
                              LanguageConstants.shippingAddressText.tr,
                              style: AppStyle.textStyleUtils500(
                                size: 18,
                              ),
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
                        SizedBox(height: 20.h),
                        TextFormField(
                          controller: _controller.firstNameController,
                          style: AppStyle.textStyleUtils400()
                              .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                          decoration: getInputDecoration(_controller.validatorList[1]
                              ? LanguageConstants.enterFirstName.tr
                              : LanguageConstants.firstNameText.tr),
                          onChanged: (val) {
                            _controller.validatorList[1] = true;
                            _controller.firstName.value = val;
                            _controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _controller.lastNameController,
                          style: AppStyle.textStyleUtils400()
                              .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                          decoration: getInputDecoration(_controller.validatorList[2]
                              ? LanguageConstants.enterLastName.tr
                              : LanguageConstants.lastNameText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controller.validatorList[2] = true;
                            _controller.lastName.value = val;
                            _controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _controller.address1Controller,
                          style: AppStyle.textStyleUtils400()
                              .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                          decoration: getInputDecoration(_controller.validatorList[3]
                              ? LanguageConstants.enterStreetAddress1.tr
                              : LanguageConstants.addressOneText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controller.validatorList[3] = true;
                            _controller.add1.value = val;
                            _controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _controller.address2Controller,
                          style: AppStyle.textStyleUtils400()
                              .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                          decoration: getInputDecoration(_controller.validatorList[5]
                              ? LanguageConstants.enterStreetAdress2.tr
                              : LanguageConstants.addressTwoText.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controller.validatorList[5] = true;
                            _controller.add2.value = val;
                            _controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _controller.address3Controller,
                          style: AppStyle.textStyleUtils400()
                              .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                          decoration: getInputDecoration(_controller.validatorList[6]
                              ? LanguageConstants.enterStreetAddress3.tr
                              : LanguageConstants.streetAddress3.tr),
                          validator: (value) {
                            if (value == null || value == '') {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controller.validatorList[6] = true;
                            _controller.add3.value = val;
                            _controller.setOnAddressChangeDeBouncer();
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _controller.cityController,
                                style: AppStyle.textStyleUtils400()
                                    .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                                decoration: getInputDecoration(_controller.validatorList[4]
                                    ? LanguageConstants.enterCityName.tr
                                    : LanguageConstants.city),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return null;
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _controller.validatorList[4] = true;
                                  _controller.city.value = val;
                                  _controller.setOnAddressChangeDeBouncer();
                                },
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 6.0,
                                ),
                                decoration:
                                    BoxDecoration(color: appTileBGcolor, borderRadius: BorderRadius.circular(12)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<CountryListModel>(
                                    items: _controller.getcountryList
                                        .map(
                                          (value) => DropdownMenuItem<CountryListModel>(
                                            value: value,
                                            child: Text(value.fullNameEnglish.toString()),
                                          ),
                                        )
                                        .toList(),
                                    isExpanded: true,
                                    hint: _controller.selectedCoutry1.value.fullNameEnglish == null
                                        ? Text(
                                            LanguageConstants.countryText.tr,
                                            style: AppStyle.textStyleUtils400(color: Colors.grey),
                                          )
                                        : Text(
                                            _controller.selectedCoutry1.value.fullNameEnglish.toString(),
                                            style: AppStyle.textStyleUtils400(),
                                          ),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      color: backGroundColor,
                                    ),
                                    // itemHeight: 40,
                                    dropdownMaxHeight: 300,
                                    dropdownPadding: null,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 28,
                                      color: Colors.black,
                                    ),
                                    onChanged: (value) {
                                      _controller.selectedCoutry1.value = value!;
                                      _controller.selectedState1.value = AvailableRegion();
                                      _controller.selectedStateList1.value =
                                          _controller.selectedCoutry1.value.availableRegions ?? [];
                                      _controller.countryName.value = value.fullNameEnglish!;
                                      _controller.setOnAddressChangeDeBouncer();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _controller.zipPovinceController,
                                style: AppStyle.textStyleUtils400()
                                    .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                                keyboardType: TextInputType.number,
                                decoration: getInputDecoration(_controller.validatorList[8]
                                    ? LanguageConstants.enterZipPostalCode.tr
                                    : LanguageConstants.zipPostalText.tr),
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return null;
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  _controller.validatorList[8] = true;
                                  _controller.zipCode.value = val;
                                  _controller.setOnAddressChangeDeBouncer();
                                },
                              ),
                            ),
                            const SizedBox(width: 6.0),
                            Expanded(
                              child: _controller.selectedStateList1.isNotEmpty
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 6.0,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<AvailableRegion>(
                                          dropdownColor: backGroundColor,
                                          items: _controller.selectedStateList1
                                              .map(
                                                (value) => DropdownMenuItem<AvailableRegion>(
                                                  value: value,
                                                  child: Text(
                                                    value.name ?? '',
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          isExpanded: true,
                                          hint: _controller.selectedState1.value.name == null
                                              ? Text(
                                                  LanguageConstants.stateText.tr,
                                                  style: AppStyle.textStyleUtils400(color: Colors.grey),
                                                )
                                              : Text(
                                                  _controller.selectedState1.value.name ?? '',
                                                  style: AppStyle.textStyleUtils400(),
                                                ),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                          onChanged: (value) {
                                            _controller.selectedState1.value = value!;
                                            _controller.state.value = _controller.selectedState1.value.name ?? '';
                                            _controller.setOnAddressChangeDeBouncer();
                                          },
                                        ),
                                      ),
                                    )
                                  : TextFormField(
                                      controller: _controller.stateController,
                                      style: AppStyle.textStyleUtils400()
                                          .copyWith(decoration: TextDecoration.none, decorationThickness: 0),
                                      decoration: getInputDecoration(_controller.validatorList[7]
                                          ? LanguageConstants.enterStateProvince.tr
                                          : LanguageConstants.stateText.tr),
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return null;
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        _controller.validatorList[7] = true;
                                        _controller.state.value = val;
                                        _controller.setOnAddressChangeDeBouncer();
                                      },
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: CommonTextPhoneField(
                                  fillColor: appTileBGcolor,
                                  filled: true,
                                  textController: _controller.phoneNumberController,
                                  country: Get.find<CountryController>().country!.value,
                                  fontStyle: AppStyle.textStyleUtils400(),
                                  hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
                                  textColor: Colors.black,
                                  cursorColor: blue,
                                  dropdownTextColor: blackColor,
                                  dropdownIconColor: appTileBGcolor,
                                  dropdownTextStyle: AppStyle.textStyleUtils400(),
                                  borderColor: Colors.transparent,
                                  errorBorderColor: Colors.black,
                                  hintText: LanguageConstants.contactNoText.tr,
                                  hintColor: Colors.black,
                                  onCountryChanged: (country) {
                                    _controller.countryCode = country.dialCode;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: ErrorTextWidget(text: _controller.phoneErrorMsg.value)),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _controller.saveAddressBook.value = 0;
                              },
                              child: Container(
                                height: 12,
                                width: 12,
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
                                        size: 10,
                                      )
                                    : Container(),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(LanguageConstants.saveInAddressBookText.tr,
                                overflow: TextOverflow.ellipsis, maxLines: 1, style: AppStyle.textStyleUtils400()),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 120.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  _controller.addAddress();
                                },
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: appColor.withOpacity(0.6),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    backgroundColor: appColor),
                                child: Text(
                                  LanguageConstants.shipHereText.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppStyle.textStyleUtils400(size: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.sp),
                            SizedBox(
                              height: 40.h,
                              width: 120.w,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: appColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Text(
                                  LanguageConstants.cancelText.tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppStyle.textStyleUtils400(size: 14.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _controller.dialogLoaderShow.value ? const ScreenLoading() : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration getInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: appTileBGcolor,

      hintText: message,
      hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
      errorStyle: AppStyle.textStyleUtils400(),
      // isDense: true,
      // suffixIcon: null,

      border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }
}
