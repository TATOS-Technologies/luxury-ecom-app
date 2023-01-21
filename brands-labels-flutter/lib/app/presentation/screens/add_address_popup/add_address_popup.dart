import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/add_address_popup_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddAddressPopUpScreen extends GetView<AddAddressPopUpController> {
  const AddAddressPopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddAddressPopUpController());

    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              AppAsset.brandsLabelsLogo,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 10.0),
                child: SvgPicture.asset(
                  AppAsset.menuIcon,
                  color: Colors.black,
                  width: 18,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                child: SvgPicture.asset(
                  AppAsset.search,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
              child: Image.asset(
                AppAsset.userIcon,
                height: 20,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                child: SvgPicture.asset(
                  AppAsset.cart,
                  color: Colors.black,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
                child: Text(
                  LanguageConstants.gdpText.tr.toUpperCase(),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
                child: Text("| ${LanguageConstants.engText.tr.toUpperCase()} |")),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
              child: Image.asset(
                AppAsset.indianFlag,
                height: 20,
              ),
            ),
          ],
        ),
        drawer: const Drawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(LanguageConstants.addNew.tr,
                          style: AppTextStyle.textStyleUtils500_16(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Add To Cart Open Dialog3
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
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
                    style: AppTextStyle.textStyleUtils500(color: const Color(0xff000080), size: 18).copyWith(
                      decoration: TextDecoration.underline,
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
              const SizedBox(height: 14.0),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      // width: 140,
                      child: TextFormField(
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
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 140,
                      child: TextFormField(
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
              const SizedBox(height: 6.0),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.streetAddress1.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterStreetAddress.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.city.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterCity.tr;
                          }
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
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.streetAddress2.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterStreetAddress.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: Container(
                      height: 40.0,
                      padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: const Color(0xff000080), width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: controller.countryList
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          isExpanded: true,
                          hint: controller.selectedCoutry.value == ""
                              ? Text(
                                  LanguageConstants.country.tr,
                                  style: AppTextStyle.textStyleUtils400(color: Colors.grey),
                                )
                              : Text(
                                  controller.selectedCoutry.value.toString(),
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          onChanged: (String? value) {
                            controller.selectedCoutry.value = value!;
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
                        decoration: getInputDecoration(LanguageConstants.streetAddress3.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterStreetAddress.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.stateProvince.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterStateProvince.tr;
                          }
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
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.zipPostalCode.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterZipPostalCode.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: getInputDecoration(LanguageConstants.enterPhoneNumber.tr),
                        validator: (value) {
                          if (value == null || value == '') {
                            return LanguageConstants.enterPhoneNumber.tr;
                          }
                          return null;
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
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: const Color(0xff000080),
                      )),
                      child: controller.saveAddressBook.value == 1
                          ? const Icon(
                              Icons.check,
                              color: Color(0xff000080),
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
                    style: AppTextStyle.textStyleUtils500(color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      LanguageConstants.shipHereText.tr,
                      style: AppTextStyle.textStyleUtils500_16(
                        color: const Color(0xff000080),
                      ).copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      LanguageConstants.cancelText.tr,
                      style: AppTextStyle.textStyleUtils500_16(
                        color: const Color(0xff000080),
                      ).copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  InputDecoration getInputDecoration(String message) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
      hintText: message,
      hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
      errorStyle: AppTextStyle.textStyleUtils400(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Color(0xff000080),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Color(0xff000080),
          width: 1.0,
        ),
      ),
      isDense: true,
      suffixIcon: null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xff000080),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
