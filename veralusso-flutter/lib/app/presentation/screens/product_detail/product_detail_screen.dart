import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:veralusso/app/controller/product_detail/product_detail_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/main/main.common.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/presentation/screens/product_detail/create_tickit_best_price_dialog.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_outofstock.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../controller/my_orders/widgets/show_ticket_response.dart';
import '../../common_widget/common_message/app_routes.dart';
import 'widgets/image_carousel.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  @override
  final ProductDetailController controller = Get.find();

  ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(title: LanguageConstants.productDetails.tr),
      body: Obx(
        () => Stack(
          children: [
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.black,
                    ),
                  )
                : SingleChildScrollView(
                    child: Theme(
                      data: Theme.of(context).copyWith(indicatorColor: blackColor, dividerColor: Colors.transparent),
                      child: Column(
                        children: [
                          ImageCarousel(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   controller.getBrands(),
                                //   style: AppStyle.subTextStyle500(size: 16.0),
                                // ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  controller.product?.value.name ?? '',
                                  style: AppStyle.subTextStyle500(
                                      size: 18.sp, color: blackColor),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: textFieldBoarderColor),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ExpansionTile(
                                    iconColor: blackColor,
                                    title: CommonTextPoppins(
                                      LanguageConstants.details.tr,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: blackColor,
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10),
                                              controller.getComposition().isNotEmpty
                                                  ? Text(
                                                      "${LanguageConstants.composition.tr} : ${controller.getComposition()}",
                                                      style: AppTextStyle.textStyleUtils500(
                                                          size: 14.sp, color: blackColor),
                                                    )
                                                  : const SizedBox.shrink(),
                                              controller.getColor().isNotEmpty
                                                  ? Text(
                                                      "${LanguageConstants.color.tr} : ${controller.getColor()}",
                                                      style: AppTextStyle.textStyleUtils500(
                                                          size: 14.sp, color: blackColor),
                                                    )
                                                  : const SizedBox.shrink(),
                                              controller.getMaterial().isNotEmpty
                                                  ? Text(
                                                      "${LanguageConstants.materialText.tr} : ${controller.getMaterial()}",
                                                      style: AppTextStyle.textStyleUtils500(
                                                          size: 14.sp, color: blackColor),
                                                    )
                                                  : const SizedBox.shrink(),
                                              SizedBox(
                                                height: 20.h,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      controller.getConvertRegularPrice(),
                                      style: AppStyle.subTextStyle500(size: 18),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        showPriceMatch(context);
                                      },
                                      child: Text(
                                        LanguageConstants.priceMatch.tr,
                                        style: AppTextStyle.textStyleUtilsUnderLine14(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    controller.estimatedTime.value == LanguageConstants.theProductIsOutOfStock.tr
                                        ? const SizedBox()
                                        : Text(
                                            controller.estimatedTime.value.split(':').first,
                                            style: AppTextStyle.textStyleUtils400(),
                                          ),
                                    controller.estimatedTime.value == LanguageConstants.theProductIsOutOfStock.tr
                                        ? const SizedBox()
                                        : Text(
                                            controller.estimatedTime.value.split(':').last,
                                            style: AppTextStyle.textStyleUtils400(),
                                          ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Visibility(
                                      visible: controller.product?.value.typeId == 'configurable',
                                      child: Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                                          child: SizedBox(
                                            height: 40,
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                items: controller.listOfChoose
                                                    .map(
                                                      (value) => DropdownMenuItem(
                                                        value: value,
                                                        child: Text(value.label.toString()),
                                                      ),
                                                    )
                                                    .toList(),
                                                isExpanded: true,
                                                hint: controller.sizeList.isEmpty
                                                    ? Text(LanguageConstants.selectSizeFirst.tr,
                                                        style: AppTextStyle.textStyleUtils400())
                                                    : Text(controller.sizeList.first.label.toString(),
                                                        style: AppTextStyle.textStyleUtils400()),
                                                icon: const Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 22,
                                                  color: Colors.black,
                                                ),
                                                iconEnabledColor: Colors.transparent,
                                                onChanged: (SizeModel? valueList) {
                                                  controller.sizeList.clear();
                                                  controller.sizeList.add(valueList!);
                                                  if (controller.sizeList.first.value == "Missing") {
                                                    controller.showDialogBoxOpen(context, true);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Visibility(
                                        visible: controller.product?.value.typeId == 'configurable',
                                        child: GestureDetector(
                                          onTap: () {
                                            imageDialog(LanguageConstants.sizeChart.tr,
                                                controller.product?.value.getSizeChart(), context);
                                          },
                                          child: Text(
                                            LanguageConstants.sizeChart.tr,
                                            style: AppStyle.subTextStyleUnderLine600(
                                                size: 14.sp, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45.w,
                                      child: ElevatedButton.icon(
                                        onPressed: controller.isInStock()
                                            ? () {
                                                controller.addToCart();
                                              }
                                            : () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: whiteColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              side: const BorderSide(color: blackColor, width: 2)),
                                        ),
                                        icon: SvgPicture.asset(AppAsset.svgAddToCartIcon),
                                        label: Text(
                                          controller.isInStock()
                                              ? LanguageConstants.addTOCart.tr
                                              : LanguageConstants.soldOut.tr,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.textStyleUtils600(),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    !controller.isInStock()
                                        ? InkWell(
                                            onTap: () {
                                              Get.to(() => OutOfStock());
                                            },
                                            child: Text(
                                              LanguageConstants.notifyMeWhenProductAvailable.tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: AppTextStyle.textStyleUtils400(),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 45.w,
                                            child: ElevatedButton.icon(
                                              onPressed: () {
                                                controller.postAddToWishlistData;

                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: whiteColor,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    side: const BorderSide(color: blackColor, width: 2)),
                                              ),
                                              icon: SvgPicture.asset(AppAsset.svgWishListIcon),
                                              label: Text(
                                                LanguageConstants.addToWishlist.tr,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: AppTextStyle.textStyleUtils600(),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                const SizedBox(
                                  height: 43,
                                ),
                                Center(
                                  child: Text(
                                    LanguageConstants.recommendation.tr,
                                    style: AppTextStyle.textStyleUtils600(size: 18.sp).copyWith(
                                        // decoration: TextDecoration.underline,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                SizedBox(
                                  height: 230.w,
                                  child: controller.itemsData.isEmpty
                                      ? const SizedBox.shrink()
                                      : controller.itemsData[0].imageUrl == null
                                          ? Center(child: Text(controller.itemsData[0].message ?? ""))
                                          : ListView.builder(
                                              physics: const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: controller.itemsData.length,
                                              itemBuilder: (context, index) => Padding(
                                                    padding: EdgeInsets.only(right: 20.w),
                                                    child: GestureDetector(
                                                onTap: () {
                                                  controller.product?.value = ProductItem(
                                                    id: int.parse(controller.itemsData[index].productId ?? ""),
                                                    sku: controller.itemsData[index].sku ?? "",
                                                  );
                                                  controller.getProductDetail();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: SizedBox(
                                                    width: 180.w,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Expanded(
                                                            child: Container(

                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            image: DecorationImage(
                                                              image: CachedNetworkImageProvider(
                                                                controller.itemsData[index].imageUrl ?? "",),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              child: const Align(
                                                                alignment:  Alignment(.8,-.8),
                                                                child:  Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: blackColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          controller.itemsData[index]
                                                                .name
                                                                .toString(),
                                                          textAlign: TextAlign.left,
                                                                maxLines: 2,
                                                          style: AppStyle.textStyleUtils400(size: 12.sp),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),

                                                            Text(
                                                              controller.itemsData[index].price ?? '',
                                                              textAlign: TextAlign.center,
                                                              style: AppStyle.textStyleUtils600(size: 12.sp),
                                                              ),
                                                          // Row(
                                                          //   mainAxisAlignment:
                                                          //       MainAxisAlignment
                                                          //           .spaceBetween,
                                                          //   children: [

                                                          //     const Icon(
                                                          //    Icons//           .favorite_border,
                                                          //       color: blackColor,
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                ),
                                              ),
                                                  ),
                                            ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            controller.isScreenLoading.value ? const ScreenLoading() : const SizedBox(),
          ],
        ),
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
        });
  }

  Future showPriceMatch(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(children: [
              Container(
                height: 350,
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        LanguageConstants.bestPricePromise.tr,
                        style: AppTextStyle.textStyleUtils400(size: 21),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.yourBestPriceAlways.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine14(color: silver),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.ifYourPreferredItemIsLowerPricedText.tr,
                        style: AppTextStyle.textStyleUtils400(color: silver),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(false);
                        },
                        child: Text(
                          LanguageConstants.simplyLetUsKnowByClickingHere.tr,
                          style: AppTextStyle.textStyleUtils400(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          showPriceMatchTicketDialog(true);
                        },
                        child: Text(
                          LanguageConstants.alreadyMadeYourPurchase.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine14(color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.contactUsScreen);
                        },
                        child: Text(
                          LanguageConstants.dontWorryLetUsKnowByClickingText.tr,
                          style: AppTextStyle.textStyleUtils400(color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesConstants.faqScreen);
                        },
                        child: Text(
                          LanguageConstants.pleaseSeeFAQsByClickingHere.tr,
                          style: AppTextStyle.textStyleUtils400(color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          );
        });
  }

  void showPriceMatchTicketDialog(bool isPurchased) {
    controller.firstNameController.text = localStore.userDetail.firstname ?? '';
    controller.lastNameController.text = localStore.userDetail.lastname ?? '';
    controller.productNameController.text = controller.product?.value.name ?? '';
    controller.styleController.text = controller.product?.value.sku ?? '';
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketForBestPriceMatchDialog(
          phoneNumberController: controller.phoneNumberController,
          emailController: TextEditingController(text: localStore.userDetail.email),
          firstNameController: controller.firstNameController,
          lastNameController: controller.lastNameController,
          urlOfImageController: controller.urlOfImageController,
          remarksController: controller.remarksController,
          isProductAvailableController: controller.isProductAvailableController,
          priceController: controller.priceController,
          linkCheaperProductController: controller.linkCheaperProductController,
          urlOfWebsiteController: controller.urlOfWebsiteController,
          styleController: controller.styleController,
          productNameController: controller.productNameController,
          keywordController: controller.keywordController,
          onTap: () async {
            String msg = await controller.createMyTicketForCancelItemOrder(isPurchased);
            Get.back();
            showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  void showTicketResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowTicketResponse(
          message: message,
        );
      },
    );
  }
}
