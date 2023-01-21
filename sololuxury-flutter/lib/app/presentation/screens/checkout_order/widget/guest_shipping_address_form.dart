import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_phone_field.dart';

import '../../../../../all_imports.dart';

class GuestShippingAddressForm extends GetView<CheckoutOrderController> {
  const GuestShippingAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColorButton2),
              child: Center(
                child: TextFormField(
                  controller: controller.emailController,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(
                    controller.validatorList[0]
                        ? LanguageConstants.emailAddressRequired.tr
                        : LanguageConstants.emailAddreessText.tr,
                  ),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList[0] = true;
                    controller.email.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
              ),
            ),
            SizedBox(height: 15.w),
            Row(
              children: [
                Expanded(
                  child: Container(
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColorButton2),
                    child: Center(
                      child: TextFormField(
                        controller: controller.firstNameController,
                        style: AppStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        decoration: getInputDecoration(
                          controller.validatorList[1]
                              ? LanguageConstants.enterFirstName.tr
                              : LanguageConstants.firstNameText.tr,
                        ),
                        onChanged: (val) {
                          controller.validatorList[1] = true;
                          controller.firstName.value = val;
                          controller.setOnAddressChangeDeBouncer();
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Container(
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColorButton2),
                    child: Center(
                      child: TextFormField(
                        controller: controller.lastNameController,
                        style: AppStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        decoration: getInputDecoration(
                          controller.validatorList[2]
                              ? LanguageConstants.enterLastName.tr
                              : LanguageConstants.lastName.tr,
                        ),
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                        onChanged: (val) {
                          controller.validatorList[2] = true;
                          controller.lastName.value = val;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
            Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColorButton2),
              child: Center(
                child: TextFormField(
                  controller: controller.address1Controller,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(
                    controller.validatorList[3]
                        ? LanguageConstants.enterStreetAddress1.tr
                        : LanguageConstants.streetAddress1.tr,
                  ),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList[3] = true;
                    controller.add1.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
              ),
            ),
            SizedBox(height: 15.w),
            Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColorButton2),
              child: Center(
                child: TextFormField(
                  controller: controller.address2Controller,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(controller.validatorList[5]
                      ? LanguageConstants.enterStreetAdress2.tr
                      : LanguageConstants.streetAddress2.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList[5] = true;
                    controller.add2.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
              ),
            ),
            SizedBox(height: 15.w),
            Container(
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: appColorButton2),
              child: Center(
                child: TextFormField(
                  controller: controller.address3Controller,
                  style: AppStyle.textStyleUtils400().copyWith(
                      decoration: TextDecoration.none, decorationThickness: 0),
                  decoration: getInputDecoration(controller.validatorList[6]
                      ? LanguageConstants.enterStreetAddress3.tr
                      : LanguageConstants.streetAddress3.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return null;
                    }
                    return null;
                  },
                  onChanged: (val) {
                    controller.validatorList[6] = true;
                    controller.add3.value = val;
                    controller.setOnAddressChangeDeBouncer();
                  },
                ),
              ),
            ),
            SizedBox(height: 15.w),
            Row(
              children: [
                Expanded(
                  child: Container(
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColorButton2),
                    child: Center(
                      child: TextFormField(
                        controller: controller.cityController,
                        style: AppStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        decoration: getInputDecoration(
                          controller.validatorList[4]
                              ? LanguageConstants.enterCityName.tr
                              : LanguageConstants.city.tr,
                        ),
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                        onChanged: (val) {
                          controller.validatorList[4] = true;
                          controller.city.value = val;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8.w),
                    height: 45.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColorButton2),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CountryListModel>(
                        dropdownColor: backGroundColor,
                        items: controller.getcountryList
                            .map(
                              (value) => DropdownMenuItem<CountryListModel>(
                                value: value,
                                child: Text(value.fullNameEnglish.toString()),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: controller
                                    .selectedCoutry1.value.fullNameEnglish ==
                                null
                            ? Text(LanguageConstants.countryText.tr,
                                style: AppStyle.textStyleUtils400(
                                    color: Colors.grey))
                            : Text(
                                controller
                                    .selectedCoutry1.value.fullNameEnglish
                                    .toString(),
                                style: AppStyle.textStyleUtils400(),
                              ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 28,
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          controller.selectedCoutry1.value = value!;
                          controller.selectedState1.value = AvailableRegion();
                          controller.selectedStateList1.value = controller
                                  .selectedCoutry1.value.availableRegions ??
                              [];
                          controller.countryName.value =
                              value.fullNameEnglish!;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
            Row(
              children: [
                Expanded(
                  child: Container(
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appColorButton2),
                    child: Center(
                      child: TextFormField(
                        controller: controller.zipPovinceController,
                        style: AppStyle.textStyleUtils400().copyWith(
                            decoration: TextDecoration.none,
                            decorationThickness: 0),
                        keyboardType: TextInputType.number,
                        decoration: getInputDecoration(
                            controller.validatorList[8]
                                ? LanguageConstants.enterZipPostalCode.tr
                                : LanguageConstants.zipPostalCode.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return null;
                          }
                          return null;
                        },
                        onChanged: (val) {
                          controller.validatorList[8] = true;
                          controller.zipCode.value = val;
                          controller.setOnAddressChangeDeBouncer();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6.0),
                Expanded(
                  child: controller.selectedStateList1.isNotEmpty
                      ? Container(
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appColorButton2),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<AvailableRegion>(
                              dropdownColor: backGroundColor,
                              items: controller.selectedStateList1
                                  .map(
                                    (value) =>
                                        DropdownMenuItem<AvailableRegion>(
                                      value: value,
                                      child: Text(
                                        value.name ?? '',
                                      ),
                                    ),
                                  )
                                  .toList(),
                              isExpanded: true,
                              hint: controller.selectedState1.value.name == null
                                  ? Text(LanguageConstants.stateText.tr,
                                      style: AppStyle.textStyleUtils400())
                                  : Text(
                                      controller.selectedState1.value.name ??
                                          '',
                                      style: AppStyle.textStyleUtils400()),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 28,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                controller.selectedState1.value = value!;
                                controller.state.value =
                                    controller.selectedState1.value.name ?? '';
                                controller.setOnAddressChangeDeBouncer();
                              },
                            ),
                          ),
                        )
                      : Container(
                          
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appColorButton2),
                          child: Center(
                            child: TextFormField(
                              controller: controller.stateController,
                              style: AppStyle.textStyleUtils400().copyWith(
                                  decoration: TextDecoration.none,
                                  decorationThickness: 0),
                              decoration: getInputDecoration(
                                  controller.validatorList[7]
                                      ? LanguageConstants.enterStateProvince.tr
                                      : LanguageConstants.stateProvince.tr),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (val) {
                                controller.validatorList[7] = true;
                                controller.state.value = val;
                                controller.setOnAddressChangeDeBouncer();
                              },
                            ),
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(
              height: 15.w,
            ),
            CommonTextPhoneField(
              textController: controller.phoneNumberController,
              country:
                  Get.find<CountryController>().country!.value.toString(),
              fillColor: appColorButton2,
              filled: true,
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              errorBorderColor: Colors.transparent,
              dropdownTextStyle: AppStyle.textStyleUtils400().copyWith(
                  decoration: TextDecoration.none, decorationThickness: 0),
              fontStyle: AppStyle.textStyleUtils400().copyWith(
                  decoration: TextDecoration.none, decorationThickness: 0),
              hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
              hintText: controller.validatorList[9]
                  ? LanguageConstants.enterPhoneNumber.tr
                  : LanguageConstants.phoneNumberText.tr,
              onCountryChanged: (country) {
                controller.countryCode = country.dialCode;
              },
              onChanged: (value) {
                controller.validatorList[9] = true;
                if (value.isValidNumber()) {
                  controller.phone.value = value.number;
                  controller.setOnAddressChangeDeBouncer();
                }
              },
              validator: (value) {
                if (value == null) {
                  return null;
                }
                return null;
              },
            ),
          ],
        ));
  }

  InputDecoration getInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
     
      hintText: message,
      hintStyle: AppStyle.textStyleUtils400(color: Colors.grey),
      errorStyle: AppStyle.textStyleUtils400(),
      isDense: true,
      suffixIcon: null,
      border: InputBorder.none,
    );
  }
}
