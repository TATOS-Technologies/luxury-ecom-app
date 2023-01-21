import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/news_letter/news_lettter_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class NewsLetterAppBar extends GetView<NewsLetterController> {
  @override
  final NewsLetterController controller = Get.find();

  NewsLetterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(Get.context!).viewPadding.top + 5.0,
                  bottom: 5.0),
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1)),
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (controller.imgList.length > 1) {
                          controller.carouselController.previousPage();
                        }
                      },
                      child: Image.asset(AppAsset.leftArrow, height: 10.0)),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 30,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                      ),
                      carouselController: controller.carouselController,
                      items: controller.imgList
                          .map((item) => Center(
                                child: CommonTextMontserrat(
                                  item.toUpperCase(),
                                  fontSize: 11.0,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                      onTap: () {
                        if (controller.imgList.length > 1) {
                          controller.carouselController.nextPage();
                        }
                      },
                      child: Image.asset(AppAsset.rightArrow1, height: 10.0)),
                ],
              ),
            ),
            Positioned(
              left: 120,
              right: 120,
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(Get.context!).viewPadding.top + 4.0,
                ),
                color: appBarDarkRed,
                height: 3.0,
              ),
            ),
            Positioned(
              left: 120.0,
              right: 120.0,
              bottom: 4.0,
              child: Container(
                color: appBarDarkRed,
                height: 3.0,
              ),
            ),
          ],
        ),
        Container(
          height: const Size.fromHeight(34).height,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // if (!controller.scaffoldkey.currentState?.isDrawerOpen) {
                      //   controller.scaffoldkey.currentState?.openDrawer();
                      // } else {
                      //   Navigator.pop(Get.context!);
                      // }
                    },
                    child: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Center(
                        child: Image.asset(
                          AppAsset.menu,
                          height: 14.0,
                          width: 14.0,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Center(
                        child: Image.asset(
                          AppAsset.searchIcon,
                          height: 14.0,
                          width: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                AppAsset.logo,
                height: 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Center(
                        child: Image.asset(
                          AppAsset.userProfile,
                          height: 14.0,
                          width: 14.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutesConstants.checkoutOrderScreen);
                    },
                    child: SizedBox(
                      height: 14.0,
                      width: 16.0,
                      child: Stack(
                        children: [
                          Image.asset(
                            AppAsset.cart1,
                            height: 14.0,
                            width: 14.0,
                            color: Colors.black,
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: const EdgeInsets.only(left: 2),
                              height: 9.0,
                              width: 9.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "1",
                                    style: AppTextStyle.textStyleUtils400(
                                        color: Colors.white, size: 8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
