// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/my_orders/widgets/show_ticket_response.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/screen_loading.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/widgets/create_ticket_best_price_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/widgets/expantion_widget.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/widgets/product_detail_outofstock.dart';

import 'widgets/add_to_cart_button.dart';
import 'widgets/add_to_wishlist_button.dart';
import 'widgets/choose_an_optionwidget.dart';
import 'widgets/image_carousel.dart';
import 'widgets/product_detail_textfields.dart';
import 'widgets/recommentaton_widget.dart';
import 'widgets/size_chart_widget.dart';
import 'widgets/start_chat_button.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
              indicatorColor: appColorButton, dividerColor: Colors.transparent),
          child: Scaffold(
            // extendBodyBehindAppBar: true,
            backgroundColor: homeBackground,
            // appBar: commonAppbar(title: "Product Details"),
            appBar: AppBar(
              title: CommonTextPoppins(
                LanguageConstants.productDetails.tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
              backgroundColor: homeBackground,
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: appColorPrimary,
              onPressed: () {
                if (localStore.customerToken.toString() == "") {
                  showTitleDialog(context);
                } else {
                  controller.clickChatEvent();
                }
              },
              child: SvgPicture.asset(AppAsset.svgLiveChat),
            ),
            body: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColor,
                      ),
                    )
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ImageCarousel(),
                              Padding(
                                padding: EdgeInsets.all(24.w),
                                child: Column(
                                  children: [
                                    CommonTextPoppins(
                                      controller.product?.value.name ?? '',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 28),
                                    ExpantionWidget(
                                      title: LanguageConstants.description.tr,
                                      child: CommonTextPoppins(
                                        controller.product?.value
                                            .getProductDescription(),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    ExpantionWidget(
                                      title: LanguageConstants.details.tr,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonTextPoppins(
                                            "${LanguageConstants.composition.tr} : ${controller.product!.value.getComposition()}",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(height: 8.h),
                                          CommonTextPoppins(
                                            "${LanguageConstants.color.tr} : ${controller.product!.value.getColor()}",
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          ),
                                          // SizedBox(height: 10.h),
                                          // const SizeChartWidget(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showPriceMatch(context);
                                          },
                                          child: CommonTextPoppins(
                                            LanguageConstants.priceMatch.tr,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                            color: appColorButton,
                                            fontSize: 14.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      children: [
                                        CommonTextPoppins(
                                          "${LanguageConstants.asLowAs.tr} ${controller.getConvertRegularPriceFromConfigurableProduct()}",
                                          fontSize: 14.sp,
                                        ),
                                        const Spacer(),
                                        CommonTextPoppins(
                                          LanguageConstants.taxAndDuties.tr,
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    controller.estimatedTime.value.contains(':')
                                        ? Row(
                                            children: [
                                              CommonTextPoppins(
                                                LanguageConstants.estimatedDeliveryDate.tr,
                                                fontSize: 14.sp,
                                                // fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                              const Spacer(),
                                              CommonTextPoppins(
                                                controller.estimatedTime.value
                                                    .split(':')
                                                    .last,
                                                fontSize: 14.sp,
                                                // fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ],
                                          )
                                        : CommonTextPoppins(
                                            controller.estimatedTime.value,
                                            fontSize: 14.sp,
                                            // fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                    SizedBox(height: 15.h),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: CommonTextPoppins(
                                        "${LanguageConstants.sku.tr}:- ${controller.product?.value.sku}",
                                        fontSize: 14.sp,
                                        // fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(height: 15),
                                    Visibility(
                                      visible: // true,
                                          controller.product?.value.typeId ==
                                              'configurable',
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Expanded(
                                            child: ChosseAnOpenWidget(),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          const SizeChartWidget(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 40.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const AddToCartButton(),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        const AddToWishlistButton(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    SizedBox(
                                        width: 327.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: appColorPrimary,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          onPressed:
                                              controller.productIsInStock()
                                                  ? () async {
                                                      await controller
                                                          .buyNowOnTap();
                                                    }
                                                  : null,
                                          child: CommonTextPoppins(
                                            controller.productIsInStock()
                                                ? LanguageConstants.buyNow.tr
                                                : LanguageConstants.soldOut.tr,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: whiteColor,
                                          ),
                                        )),
                                    if (!controller.productIsInStock())
                                      Padding(
                                        padding: EdgeInsets.only(top: 15.h),
                                        child: InkWell(
                                          onTap: () async {
                                            Get.to<dynamic>(
                                                () => const OutOfStock());
                                            /*  await controller.notifyOnClick();*/
                                          },
                                          child: SizedBox(
                                            width: 327.w,
                                            child: CommonTextPoppins(
                                              LanguageConstants
                                                  .notifyMeWhenThisProductIsInStock
                                                  .tr,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                  ],
                                ),
                              ),
                              controller.itemsData.isEmpty
                                  ? const SizedBox()
                                  : Center(
                                      child: CommonTextPoppins(
                                          LanguageConstants.recommendation.tr,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.sp,
                                          color: blackColor),
                                    ),
                              const SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                  child: controller.itemsData.isEmpty
                                      ? Container()
                                      : controller.itemsData[0].imageUrl == null
                                          ? Center(
                                              child: Text(controller
                                                  .itemsData[0].message
                                                  .toString()),
                                            )
                                          : const RecommentationWidget()),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        controller.isAddToCartLoading.value
                            ? const ScreenLoading()
                            : const SizedBox(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future showPriceMatch(BuildContext context) {
    return showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            contentPadding: EdgeInsets.all(30.w),
            contentWidget: Stack(children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        LanguageConstants.bestPricePromise.tr,
                        style: AppStyle.textStyleUtils400(
                            size: 21.0, color: appColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants.yourBestPriceAlways.tr,
                        style: AppStyle.textStyleUtils400(color: silver)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        LanguageConstants
                            .ifYourPreferredItemIsLowerPricedText.tr,
                        style: AppStyle.textStyleUtils400(color: silver),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back<dynamic>();
                          showPriceMatchTicketDialog(false);
                        },
                        child: Text(
                          LanguageConstants.simplyLetUsKnowByClickingHere.tr,
                          style: AppStyle.textStyleUtils400(color: appColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back<dynamic>();
                          showPriceMatchTicketDialog(true);
                        },
                        child: Text(
                          LanguageConstants.alreadyMadeYourPurchase.tr,
                          style: AppStyle.textStyleUtils400(color: silver)
                              .copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed<dynamic>(RoutesConstants.contactUsScreen);
                        },
                        child: Text(
                          LanguageConstants.dontWorryLetUsKnowByClickingText.tr,
                          style: AppStyle.textStyleUtils400(color: silver),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed<dynamic>(RoutesConstants.faqScreen);
                        },
                        child: Text(
                          LanguageConstants.pleaseSeeFAQsByClickingHere.tr,
                          style: AppStyle.textStyleUtils400(color: silver),
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
                    Get.back<dynamic>();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: appColor,
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
    controller.productNameController.text =
        controller.product?.value.name ?? '';
    controller.styleController.text = controller.product?.value.sku ?? '';
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CreateTicketForBestPriceMatchDialog(
          phoneNumberController: controller.phoneNumberController,
          emailController:
              TextEditingController(text: localStore.userDetail.email),
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
            String msg =
                await controller.createMyTicketForCancelItemOrder(isPurchased);
            Get.back<dynamic>();
            showTicketResponseDialog(Get.context!, msg);
          },
        );
      },
    );
  }

  void showTicketResponseDialog(BuildContext context, String message) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return ShowTicketResponse(
          message: message,
        );
      },
    );
  }

  Future showTitleDialog(BuildContext context) {
    return showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: -45.0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: appColor,
                    child: Image.asset(
                      AppAsset.account,
                      color: Colors.white,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                Form(
                  key: controller.formKeyChat,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        //height: 70,
                        margin: const EdgeInsets.only(top: 60),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                LanguageConstants.welcometoChatText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400_16(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                LanguageConstants.fillTheFormText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: appColorAccent,
                                border: Border.all(
                                  color: appColor,
                                  width: 1,
                                ),
                              ),
                              child: const NameTextField(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: appColorAccent,
                                border: Border.all(
                                  color: appColor,
                                  width: 1,
                                ),
                              ),
                              child: const EmailTextField(),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: StartChatButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
