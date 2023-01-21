import 'package:brandslabels/app/controller/product_detail_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/screen_loading.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/prodct_detail_recommended.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/product_detail_image_carosal.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/product_detail_outOfStock.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';

import '../../common_widgets/common_widget/common_text_poppins.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.productDetails.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: darkBlue,
                ),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductImageCarosal(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          color: whiteColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 2),
                                //   child: Text(
                                //     controller.product?.value
                                //             .getBrandName() ??
                                //         '',
                                //     style: AppTextStyle.textStyleUtils500(
                                //         size: 18.sp),
                                //   ),
                                // ),
                                Text(
                                  controller.product?.value.name ?? '',
                                  style: AppTextStyle.textStyleUtils500(
                                      size: 16.sp),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                expandDetailWidget(
                                  text: LanguageConstants.description.tr,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      controller.product!.value
                                          .getProductDescription(),
                                      style: AppTextStyle.textStyleUtils500(
                                        size: 12.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                expandDetailWidget(
                                  text: LanguageConstants.details.tr,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${LanguageConstants.composition.tr} : ${controller.product!.value.getComposition()}",
                                        style: AppTextStyle.textStyleUtils500(
                                          size: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "${LanguageConstants.color.tr} : ${controller.product!.value.getColor()}",
                                        style: AppTextStyle.textStyleUtils500(
                                          size: 12.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        controller
                                            .getConvertRegularPriceFromConfigurableProduct(),
                                        style:
                                            AppTextStyle.textStyleUtils400_16(),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        const ProductDetailRecommendedProducts()
                                            .showPriceMatch(context);
                                      },
                                      child: Text(
                                        LanguageConstants.priceMatch.tr,
                                        style: AppTextStyle
                                            .textStyleUtilsUnderLine14(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                controller.estimatedTime.value ==
                                        "The product is out of stock."
                                    ? const SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: Text(
                                              controller.estimatedTime.value,
                                              style: AppTextStyle
                                                  .textStyleUtils400()),
                                        ),
                                      ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "${LanguageConstants.sku.tr}: ${controller.product!.value.sku}",
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),

                                Visibility(
                                  visible: controller.product!.value.typeId ==
                                      'configurable',
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // height: 30.h,
                                          width: 230.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: borderGrey,
                                              width: 1,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              alignment: Alignment.center,
                                              items: controller.listOfChoose
                                                  .map(
                                                    (value) => DropdownMenuItem(
                                                      value: value,
                                                      child: Text(
                                                          value.label ?? ''),
                                                    ),
                                                  )
                                                  .toList(),
                                              isExpanded: true,
                                              hint: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w),
                                                child: controller
                                                        .sizeList.isEmpty
                                                    ? Text(
                                                        LanguageConstants
                                                            .chooseAnOption.tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    : Text(
                                                        controller.sizeList
                                                                .first.label ??
                                                            '',
                                                        style: AppTextStyle
                                                            .textStyleUtils400(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 22,
                                                color: Colors.black,
                                              ),
                                              iconEnabledColor:
                                                  Colors.transparent,
                                              onChanged:
                                                  (SizeModel? valueList) {
                                                debugPrint("Val");
                                                controller.sizeList.clear();
                                                controller.sizeList.add(
                                                    valueList ?? SizeModel());
                                                if ((controller.sizeList.first
                                                            .value ??
                                                        '') ==
                                                    "Missing") {
                                                  controller.showDialogBoxOpen(
                                                      context, true);
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () {
                                                imageDialog(
                                                    LanguageConstants
                                                        .sizeChart.tr,
                                                    controller.product!.value
                                                        .getSizeChart(),
                                                    context);
                                              },
                                              child: Text(
                                                LanguageConstants.sizeChart.tr,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle
                                                    .textStyleUtilsUnderLine14(
                                                        fontWeight:
                                                            FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 40.w,
                                        child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: whiteColor,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: BorderSide(
                                                        color: primary,
                                                        width: 2.sp))),
                                            onPressed:
                                                !controller.productIsInStock()
                                                    ? null
                                                    : () {
                                                        controller.addToCart();
                                                      },
                                            icon: SvgPicture.asset(
                                                AppAsset.svgAddtoCart),
                                            label: CommonTextPoppins(
                                              LanguageConstants.addToCart.tr,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: primary,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 40.w,
                                        child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: whiteColor,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    side: BorderSide(
                                                        color: primary,
                                                        width: 2.sp))),
                                            onPressed:
                                                !controller.iswishlist.value
                                                    ? () async {
                                                        await controller
                                                            .postAddToWishlistData();
                                                      }
                                                    : () {
                                                        Get.rawSnackbar(
                                                            message:
                                                                'Already added to wishlist');
                                                      },
                                            icon: !controller.iswishlist.value
                                                ? SvgPicture.asset(
                                                    AppAsset.svgaddTowhishlist)
                                                : const Icon(
                                                    Icons.favorite,
                                                    size: 20,
                                                    color: primary,
                                                  ),
                                            label: CommonTextPoppins(
                                              LanguageConstants
                                                  .addToWishlist.tr,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: primary,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: controller.productIsInStock()
                                      ? SizedBox(
                                          height: 40.w,
                                          width: 250.w,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primary,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    // side: BorderSide(color: primary,width: 2.sp)
                                                  )),
                                              onPressed: () async {
                                                await controller.buyNowOnTap();
                                              },
                                              child: CommonTextPoppins(
                                                LanguageConstants.buyNow.tr,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor,
                                              )),
                                        )
                                      : InkWell(
                                          onTap: () async {
                                            Get.to(() => const OutOfStock());
                                            /* await controller
                                                .notifyWhenAvailableOnTap(
                                                    context);*/
                                          },
                                          child: Text(
                                              "Notify Me When This Product Is In Stock ",
                                              style: AppTextStyle
                                                  .textStyleUtilsUnderLine14(
                                                      color: primary,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      thickness: .6)),
                                        ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text(
                            LanguageConstants.recommendation.tr,
                            style: AppTextStyle.textStyleUtils500(size: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 240.w,
                          child: controller.itemsData.isEmpty
                              ? const SizedBox.shrink()
                              : controller.itemsData[0].imageUrl != null
                                  ? const ProductDetailRecommendedProducts()
                                  : Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.h),
                                        child: Text(
                                          controller.itemsData[0].message ?? '',
                                        ),
                                      ),
                                    ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }

  Widget expandDetailWidget({String? text, Widget? child}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderGrey),
          borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        iconColor: primary,
        title: CommonTextPoppins(
          text,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: primary,
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w), child: child),
          ),
        ],
      ),
    );
  }

  void imageDialog(text, path, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.all(20),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$text',
                      style: AppTextStyle.textStyleUtils500_16(),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 16,
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Image.network(
                '$path',
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}
