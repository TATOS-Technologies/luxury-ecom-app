// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/product_listing/product_list_screen.dart';

import '../../../../../all_imports.dart';

class ProductsWidget extends GetView<ProductController> {
  ProductsWidget({Key? key}) : super(key: key);

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.productModel?.value.items =
        controller.productModel?.value.items?.where((element) {
      debugPrint("element -> $element");
      return element.visibility == 4;
    }).toList();
    return Obx(() => controller.itemList.isNotEmpty
        ? Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.transparent,
                floatingActionButton: Container(
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8,
                    ),
                    child: Text(
                      '${controller.productCount.value.toString()}/${(controller.productModel?.value.totalCount ?? 0).toString()}',
                      style: AppStyle.textStyleUtils400(
                          size: 10, color: Colors.white),
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startFloat,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        controller: controller.scrollController,
                        addAutomaticKeepAlives: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12.5,
                          childAspectRatio: 0.77,
                        ),
                        itemBuilder: (_, index) {
                          ProductItem? item = controller.itemList[index];
                          return Container(
                            padding: EdgeInsets.all(8.w),
                            child: Padding(
                              padding:  EdgeInsets.all(4.w),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed<dynamic>(
                                    RoutesConstants.productDetailsScreen,
                                    arguments: [item, Get.arguments[0]],
                                  )?.whenComplete(() {
                                    cartController.getGenerateCart();
                                  }); //controller.setRecentlyItem(item);
                                },
                                child: Tooltip(
                                  message: LanguageConstants.scrollToSeeMoreImages.tr,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: LayoutBuilder(
                                                builder: (context, constraints) {
                                                  return Container(
                                                    
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xfffffcf9),
                                                    ),
                                                    child: item.mediaGalleryEntries!
                                                                .isEmpty ||
                                                            item
                                                                .mediaGalleryEntries![
                                                                    0]
                                                                .file!
                                                                .isEmpty
                                                        ? Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30.w),
                                                            child:
                                                                SvgPicture.asset(
                                                              AppAsset.svgLogo,
                                                            ),
                                                          )
                                                        : PageView.builder(
                                                            itemCount: controller
                                                                .productImageList[
                                                                    index]
                                                                .length,
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            onPageChanged:
                                                                (int index2) {
                                                              controller.dotsList[
                                                                      index] =
                                                                  List.generate(
                                                                controller
                                                                    .dotsList[
                                                                        index]
                                                                    .length,
                                                                (index) => false,
                                                              );
                                                              controller.dotsList[
                                                                      index]
                                                                  [index2] = true;
                                                              controller.update(
                                                                [
                                                                  'images_dots',
                                                                  'back_button',
                                                                  'next_button'
                                                                ],
                                                              );
                                                            },
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemBuilder: (context,
                                                                index2) {
                                                              return SizedBox(
                                                                width: 156.w,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      "${AppConstants.productImageUrl}${controller.productImageList[index][index2]}",
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  memCacheWidth:
                                                                      200,
                                                                  memCacheHeight:
                                                                      150,
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Container(
                                                                          color: const Color(0xfffffcf9)
                                                                              .withOpacity(0.5)),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Image.asset(
                                                                    AppAsset.logo,
                                                                    color: const Color(
                                                                        0xfffffcf9),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              left: 0,
                                              right: 0,
                                              child: Center(
                                                child: SizedBox(
                                                  height: 5,
                                                  child: ListView.builder(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: controller
                                                        .dotsList[index].length,
                                                    itemBuilder:
                                                        (context, index2) {
                                                      return GetBuilder<
                                                          ProductController>(
                                                        id: "images_dots",
                                                        builder: (controller) {
                                                          return AnimatedContainer(
                                                            height: 5,
                                                            width: 5,
                                                            duration:
                                                                200.milliseconds,
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 2,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape:
                                                                  BoxShape.circle,
                                                              color: controller
                                                                          .dotsList[
                                                                      index][index2]
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${item.name}"
                                                      .toUpperCase()
                                                      .toTitleCase(),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: AppStyle
                                                          .textStyleUtils400(size: 12.sp)
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item.extensionAttributes
                                                          ?.convertedRegularPrice ??
                                                      '',
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      AppStyle.textStyleUtils600(
                                                              size: 12.sp)
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: controller.itemList.length,
                      ),
                    ),
                    controller.productLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(
                              color: appColor,
                              size: 20.0,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              GetBuilder<ProductController>(
                id: 'visibleLoader',
                builder: (controller) {
                  return controller.visibleLoader == false
                      ? const SizedBox()
                      : Center(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: const SpinKitThreeBounce(
                              color: appColor,
                            ),
                          ),
                        );
                },
              ),
            ],
          )
        : // const NoData(showText: "No Data Found")
        Get.arguments != null
            ? NoDataProduct(
                isBrand: Get.arguments[0] == "brand",
                title: Get.arguments[2].toString(),
                argument: Get.arguments[0].toString())
            : const NoDataProductSearch());
  }
}

///
/// [NoDataProduct]
///
class NoDataProduct extends StatelessWidget {
  NoDataProduct(
      {Key? key,
      required this.isBrand,
      required this.argument,
      required this.title})
      : super(key: key);

  bool isBrand;
  String argument;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            isBrand
                ? LanguageConstants
                    .itSeemsLikeWeHaveNothingToShowForThisBrand.tr
                : LanguageConstants
                    .itSeemsWeHaveNothingToShowForThisCategory.tr,
            style: AppStyle.textStyleUtils500(color: appColorButton),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CommonTextPoppins(
              '${LanguageConstants.ifyouwouldlikeUsSendYouTheCollectionFrom.tr} $title ${LanguageConstants.plsCreateATicketBelow.tr}',
              textAlign: TextAlign.center,
              color: appColorButton,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              
              children: [
                Expanded(
                  child: CommonThemeButton(
                    onTap: () {
                      // Get.find<SpecialRequestController>().brandName = Get.arguments[2];
                      // Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                      Get.toNamed<dynamic>(RoutesConstants.specialRequesScreen,
                          arguments: [title, argument]);
                    },
                    isOutLined: true,
                    buttonColor: homeBackground,
                    textColor: primary,
                    title:
                      LanguageConstants.createTicket.tr,
                     
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: CommonThemeButton(
                    onTap: () {
                      Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                    },
                    title:
                      LanguageConstants.continueShopping.tr,
                     
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///
/// [NoDataProductSearch]
///
class NoDataProductSearch extends StatelessWidget {
  const NoDataProductSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            '${LanguageConstants.itSeemsWeHaveNothingToShowFor.tr} advance search',
            style: AppStyle.textStyleUtils500(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                CommonThemeButton(
                  onTap: () {
                    Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                  },
                 title: 
                    LanguageConstants.continueShopping.tr,
                   
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
