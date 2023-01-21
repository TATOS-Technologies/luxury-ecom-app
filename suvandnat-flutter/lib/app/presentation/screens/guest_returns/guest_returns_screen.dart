import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/guest_returns/guest_returns_controller.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/core/const/image_constant.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/bottom_navigation_bar/custom_bottom_bar.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _addressList = [LanguageConstants.addressBook.tr];
    final controller = Get.put(GuestReturnsController());

    return Scaffold(
      drawerEnableOpenDragGesture: false,
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
                                  LanguageConstants.gdpText.tr,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 10),
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
                                  LanguageConstants.englishText.tr
                                      .toUpperCase(),
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 10),
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
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.checkYourOrderText.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils500_16(
                          color: const Color(0xff973133)),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Text(
                  LanguageConstants.enterYourOrderText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding:
                        const EdgeInsets.only(bottom: 10, top: 10, left: 100),
                    hintText: LanguageConstants.orderReference.tr,
                    labelStyle:
                        AppTextStyle.textStyleUtils400(color: Colors.black26),
                    errorStyle:
                        AppTextStyle.textStyleUtils400(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xff973133),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xff973133),
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff973133),
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    text: "${LanguageConstants.howDoIFindText.tr} ",
                    style: AppTextStyle.textStyleUtils400(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: LanguageConstants.orderRefernceText.tr,
                        style: AppTextStyle.textStyleUtils400().copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(LanguageConstants.submitText.tr),
                    style: ElevatedButton.styleFrom(
                      // shape: StadiumBorder(),
                      backgroundColor: const Color(0xff973133),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width / 2.2),
          const CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
