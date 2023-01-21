import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/charity/widgets/charity_dialog_content.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/core/const/image_constant.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/charity/charity_popup_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class CharityPopUp extends GetView<CharityPopUpController> {
  const CharityPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharityPopUpController());

    final List<String> _addressList = [LanguageConstants.addressBook.tr];
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
                      LanguageConstants.findCheaperText.tr.toUpperCase(),
                      style:
                          AppTextStyle.textStyleUtils400(color: Colors.white),
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
                              controller.scaffoldKey.value.currentState!
                                  .openDrawer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, top: 16, bottom: 16),
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
                                      "GDP",
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 10),
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
                                      "English".toUpperCase(),
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 10),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _showDialog(
                          context,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text("Add New",
                            style: AppTextStyle.textStyleUtils500_16(
                                color: Colors.white)),
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
  void _showDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(() => Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: const CharityDialogContent(),
            ));
      },
    );
  }
}
