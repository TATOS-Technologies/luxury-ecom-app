import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/about_us/about_us_screen.dart';
import 'package:suvandnat/app/presentation/screens/refer_friend/refer_friend_screen.dart';
import 'package:suvandnat/app/presentation/screens/select_country/widgets/details_button.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/core/const/image_constant.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/select_country/select_country_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class SelectCountryScreen extends GetView<SelectCountryController> {
  SelectCountryScreen({Key? key}) : super(key: key);

  @override
  final SelectCountryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<String> _addressList = [LanguageConstants.addressBook.tr];
    SelectCountryController controller = Get.find<SelectCountryController>();

    return Obx(() => Scaffold(
          drawerEnableOpenDragGesture: false,
          backgroundColor: const Color(0xffd1f2ff),
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height / 7,
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
                                Icons.arrow_drop_down,
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
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 10),
                                    ),
                                    onChanged: (String? value) {},
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
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
                                      style: AppTextStyle.textStyleUtils400(
                                          size: 10),
                                    ),
                                    onChanged: (String? value) {},
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
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
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: Color(0xFF973133),
                ))
              : ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        LanguageConstants.chooseCountryText.tr,
                        style: AppTextStyle.textStyleUtils400(size: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: controller.getcountryList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              height: 60,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller
                                          .getcountryList[index].fullNameEnglish
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: const Color(0xffDEF3FD),
                                  border: Border.all(
                                      color: Colors.black38, width: 1),
                                  borderRadius: BorderRadius.circular(0)),
                            );
                          }),
                    ),
                    const SizedBox(height: 60),
                    DetailsButton(LanguageConstants.aboutUsText.tr, 1),
                    Visibility(
                      visible: controller.index.value == 1 ? true : false,
                      child: Container(
                        color: const Color(0xff973133),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                LanguageConstants.helpTheNeedyText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const AboutUsScreen());
                              },
                              child: Text(
                                LanguageConstants.aboutUsText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(() => const ReferFriendScreen());
                              },
                              child: Text(
                                LanguageConstants.referFriendText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                LanguageConstants.returnsRefundsText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                LanguageConstants.faqText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DetailsButton(LanguageConstants.socialText.tr, 3),
                    DetailsButton(LanguageConstants.contactText.tr, 2),
                    DetailsButton(LanguageConstants.newsletterText.tr, 4),
                  ],
                ),
        ));
  }
}
