import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/guest_returns/guest_returns_controller.dart';
import 'package:veralusso/app/core/const/image_constant.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class GuestReturnsAppBar extends GetView<GuestReturnsController> {
  final List<String> imgList;
  final CarouselController ccontroller;
  @override
  final GuestReturnsController controller = Get.find();
  GuestReturnsAppBar(this.imgList, this.ccontroller, {Key? key})
      : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height / 7,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Column(
        children: [
          Container(
            height: 2,
            width: 160,
            color: Colors.red,
          ),
          Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () => imgList.length > 1
                        ? ccontroller.previousPage()
                        : Container(),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 40,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                    ),
                    carouselController: ccontroller,
                    items: imgList
                        .map((item) => Center(
                                child: Text(
                              item.toUpperCase(),
                              style: AppTextStyle.textStyleUtils400(size: 11),
                            )))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () => imgList.length > 1
                        ? ccontroller.nextPage()
                        : Container(),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            width: 160,
            color: Colors.red,
          ),
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
                        controller.scaffoldKey.value.currentState?.openDrawer();
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
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(ImageConstant.searchIcon),
                    ),
                  ],
                ),
                Image.asset(AppAsset.veraLussoLogo, width: 110),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8.0),
                        child: Image.asset(
                          AppAsset.user,
                          height: 16,
                          width: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () {},
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 8.0),
                            child: Image.asset(
                              AppAsset.shoppingCart,
                              height: 16,
                              width: 16,
                              color: Colors.black,
                            ))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child:
            Container(height: 1.0, width: double.infinity, color: Colors.black),
      ),
    );
  }
}
