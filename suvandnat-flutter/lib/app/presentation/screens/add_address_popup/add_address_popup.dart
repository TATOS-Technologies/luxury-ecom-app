import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/image_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/add_address_popup/add_address_popup_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class AddAddressPopUp extends GetView<AddAddressPopUpController> {
  AddAddressPopUp({Key? key}) : super(key: key);

  final AddAddressPopUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddAddressPopUpController());

    final List<String> _addressList = [
      LanguageConstants.addressBook.tr,
    ];
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: const Color(0xffd1f2ff),
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height / 8,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: const Color(0xffd1f2ff),
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Column(
              children: [
                Container(
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xFF973133)),
                    child: Text(
                      LanguageConstants.findCheaperText.tr,
                      style: AppTextStyle.textStyleUtils400(color: Colors.white),
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.scaffoldKey.value.currentState!.openDrawer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0, top: 16, bottom: 16),
                              child: SvgPicture.asset(
                                ImageConstant.menuIcon,
                                color: Colors.black,
                                height: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Image.asset(AppAsset.suvandnetLogo, width: 110),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAsset.coutryImage,
                                height: 12,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              ),
                              const SizedBox(width: 2),
                              SizedBox(
                                width: 20,
                                height: 10,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: const SizedBox.shrink(),
                                    items: _addressList
                                        .map((value) => DropdownMenuItem(
                                              child: Text(value),
                                              value: value,
                                            ))
                                        .toList(),
                                    isExpanded: true,
                                    hint: Text(
                                      LanguageConstants.gdpText.tr,
                                      style: AppTextStyle.textStyleUtils400(size: 10),
                                    ),
                                    onChanged: (String? value) {},
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              ),
                              const SizedBox(width: 2),
                              SizedBox(
                                width: 45,
                                height: 10,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: const SizedBox.shrink(),
                                    items: _addressList
                                        .map((value) => DropdownMenuItem(
                                              child: Text(value),
                                              value: value,
                                            ))
                                        .toList(),
                                    isExpanded: true,
                                    hint: Text(
                                      LanguageConstants.englishText.tr.toUpperCase(),
                                      style: AppTextStyle.textStyleUtils400(size: 10),
                                    ),
                                    onChanged: (String? value) {},
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  ImageConstant.searchIcon,
                                  color: Colors.black,
                                  height: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  AppAsset.user,
                                  height: 18,
                                  width: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  AppAsset.heart,
                                  color: Colors.black,
                                  height: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  AppAsset.cart,
                                  color: Colors.black,
                                  height: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
        ));
  }

  //Add To Cart Open Dialog3
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 6.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: const Color(0xffd1f2ff),
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
                    style: AppTextStyle.textStyleUtilsUnderLine18(
                        color: const Color(0xff973133), fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Color(0xff973133),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              SizedBox(
                height: 40,
                // width: 140,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.firstNameText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterFirstName.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.lastNameText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterLastName.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.streetAdd1Text.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterStreetAddress.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.streetAdd2Text.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterStreetAddress.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.streetAdd3Text.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterStreetAddress.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              const SizedBox(width: 10.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.city.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterCity.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              Container(
                height: 40.0,
                padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: const Color(0xff973133).withOpacity(0.6), width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: controller.countryList
                        .map((value) => DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            ))
                        .toList(),
                    isExpanded: true,
                    hint: controller.selectedCoutry.value == ""
                        ? Text(
                            LanguageConstants.countryText.tr,
                            style: AppTextStyle.textStyleUtils400(),
                          )
                        : Text(
                            controller.selectedCoutry.value.toString(),
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: const Color(0xff973133).withOpacity(0.6),
                    ),
                    onChanged: (String? value) {
                      controller.selectedCoutry.value = value!;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.stateAndProvienText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterStateProvince.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.zipPostalCode.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterZipPostalCode.tr;
                    }
                    return "";
                  },
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                height: 40,
                child: TextFormField(
                  decoration: getInputDecoration(LanguageConstants.phoneNumberText.tr),
                  validator: (value) {
                    if (value == null || value == '') {
                      return LanguageConstants.enterPhoneNumber.tr;
                    }
                    return "";
                  },
                ),
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
                      decoration: BoxDecoration(border: Border.all(color: const Color(0xff973133))),
                      child: controller.saveAddressBook.value == 1
                          ? const Icon(
                              Icons.check,
                              color: Color(0xff973133),
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
                    onPressed: () {},
                    child: Text(
                      LanguageConstants.shipHereText.tr,
                      style: AppTextStyle.textStyleUtils400(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // <-- Radius
                      ),
                      backgroundColor: const Color(0xff973133),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      LanguageConstants.cancelText.tr,
                      style: AppTextStyle.textStyleUtils400(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // <-- Radius
                      ),
                      backgroundColor: const Color(0xff973133),
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

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 12, left: 10),
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils400(),
      errorStyle: AppTextStyle.textStyleUtils400(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: const Color(0xff973133).withOpacity(0.6),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: const Color(0xff973133).withOpacity(0.6),
          width: 1.0,
        ),
      ),
      isDense: true,
      suffixIcon: null,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color(0xff973133).withOpacity(0.6),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
