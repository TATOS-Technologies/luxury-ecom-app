import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/common_widget/screen_loading.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/cart_number.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/cart_price.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/confirmation_dialog_for_add_to_wish_list.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/confirmation_dialog_for_remove.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/confirmation_dialog_for_remove_cart_product.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/donate_design.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/show_all_coupons_list.dart';

class CartScreen extends GetView<CartController> {
  bool refreshCart = false;

  CartScreen({Key? key}) : super(key: key) {
    refreshCart =
        Get.arguments != null && Get.arguments is bool && Get.arguments == true;
    if (refreshCart) {
      controller.refreshCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.cartDetails.tr),
      body: Obx(
        () => controller.isMainLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : Stack(
                children: [
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Container(
                          // padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: appTileBorderColor),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 45.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: appColorButton2,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 15.w),
                                    child: CommonTextPoppins(
                                      LanguageConstants.itemText.tr,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appColorButton,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.w,
                              ),
                              (controller.cartModel.value.items?.isNotEmpty ==
                                      true)
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: controller
                                              .cartModel.value.items?.length ??
                                          0,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        width: Get.width,
                                        margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        RoutesConstants
                                                            .productDetailsScreen,
                                                        parameters: {
                                                          kRouteParameterProductSkuKey:
                                                              controller
                                                                      .cartModel
                                                                      .value
                                                                      .items?[
                                                                          index]
                                                                      .sku ??
                                                                  ''
                                                        })?.whenComplete(
                                                      () {
                                                        controller
                                                            .getGenerateCart();
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Container(
                                                            width: 97.w,
                                                            height: 91.w,
                                                            color: productBG,
                                                            child: Stack(
                                                              children: [
                                                                controller.getProductImage(
                                                                            index) !=
                                                                        ""
                                                                    ? CachedNetworkImage(
                                                                        width:
                                                                            97.w,
                                                                        height:
                                                                            91.w,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        imageUrl:
                                                                            controller.getProductImage(index),
                                                                        //  placeholder: (context, url) => const CircularProgressIndicator(),
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                downloadProgress) =>
                                                                            Lottie.asset(
                                                                          AppAsset
                                                                              .loader,
                                                                          width:
                                                                              65,
                                                                        ),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            const Icon(
                                                                          Icons
                                                                              .error,
                                                                        ),
                                                                      )
                                                                    : const SizedBox(),
                                                                Align(
                                                                  alignment:
                                                                      const Alignment(
                                                                          .8,
                                                                          -.8),
                                                                  child:
                                                                      Tooltip(
                                                                    message:
                                                                        LanguageConstants
                                                                            .addProductToYourWishList
                                                                            .tr,
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        // controller
                                                                        //     .postAddToWishlistData(
                                                                        //         index);
                                                                        confirmationDialogForAddToWishList(
                                                                          index,
                                                                          context,
                                                                        );
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .favorite_border,
                                                                        color:
                                                                            blackColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 30,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              controller
                                                                  .getProductName(
                                                                index,
                                                              ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: AppStyle
                                                                  .textStyleUtils400(
                                                                size: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                              LanguageConstants
                                                                  .size32.tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: AppStyle
                                                                  .textStyleUtils400(
                                                                size: 16.0,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  LanguageConstants
                                                                      .colorBlack
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style: AppStyle
                                                                      .textStyleUtils400(
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Get.toNamed(
                                                                        RoutesConstants
                                                                            .productDetailsScreen,
                                                                        parameters: {
                                                                          kRouteParameterProductSkuKey:
                                                                              controller.cartModel.value.items?[index].sku ?? ''
                                                                        });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .edit_outlined,
                                                                    size: 15.r,
                                                                    color:
                                                                        appColorPrimary,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 8.w,
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    confirmationDialogForRemoveCartProduct(
                                                                        index,
                                                                        context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete_outline_outlined,
                                                                    size: 15.r,
                                                                    color:
                                                                        appColorPrimary,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .firstCapitalize(
                                                        LanguageConstants
                                                            .qtyText.tr,
                                                      ),
                                                      style: AppStyle
                                                          .textStyleUtils600(
                                                              size: 16.sp,
                                                              color:
                                                                  appColorButton),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          if (controller
                                                                  .cartModel
                                                                  .value
                                                                  .items?[index]
                                                                  .qty ==
                                                              1) {
                                                            confirmationDialogForRemove(
                                                                index, context);
                                                          } else {
                                                            controller
                                                                .postRemoveFromCartData(
                                                              index,
                                                            );
                                                          }
                                                        },
                                                        child: SvgPicture.asset(
                                                            AppAsset
                                                                .svgNegative)),
                                                    Container(
                                                      width: 30,
                                                      height: 32,
                                                      alignment:
                                                          Alignment.center,
                                                      child: CartNumber(
                                                        index,
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          controller
                                                              .increaseProductQty(
                                                            index,
                                                          );
                                                          // controller.
                                                        },
                                                        child: SvgPicture.asset(
                                                            AppAsset.svgPlus)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          controller
                                                              .firstCapitalize(
                                                            '${LanguageConstants.subTotal.tr}   ',
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: AppStyle
                                                              .textStyleUtils600(
                                                                  size: 14.sp,
                                                                  color:
                                                                      appColorButton),
                                                        ),
                                                      ),
                                                    ),
                                                    CartPrice(index),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        const NothigToShowAnimationWidget(),
                                        CommonTextPoppins(
                                            LanguageConstants.noDataFound.tr),
                                        SizedBox(
                                          height: 20.h,
                                        )
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                      controller.showAppliedCoupons.value
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonTextPoppins(
                                      controller.getTotalsData.value
                                                  .getDiscountName() ==
                                              null
                                          ? '${LanguageConstants.discount.tr}(${controller.promoCodeController.text})'
                                          : controller.getTotalsData.value
                                              .getDiscountName()!,
                                      style: AppStyle.textStyleUtils600(
                                          size: 14, color: appColorButton),
                                      textAlign: TextAlign.left,
                                    ),
                                    CommonTextPoppins(
                                      controller.getTotalsData.value
                                              .getDiscount() ??
                                          '',
                                      fontSize: 14.sp,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),

                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height: 45.h,
                            width: 345.w,
                            decoration: BoxDecoration(
                                color: appTileBGcolor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Form(
                                    key: controller.formKey,
                                    child: TextFormField(
                                      cursorColor: appColor,
                                      controller:
                                          controller.promoCodeController,
                                      validator: (value) =>
                                          Validators.validateRequired(
                                              value?.trim() ?? '', '*'),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        contentPadding: const EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                          left: 10,
                                        ),
                                        hintText: LanguageConstants
                                            .enterDiscountCodeText.tr,
                                        hintStyle: AppStyle.textStyleUtils400(
                                          color: Colors.grey,
                                        ),
                                        labelStyle:
                                            AppTextStyle.textStyleUtils400(
                                                color: Colors.black54),
                                        errorStyle:
                                            AppTextStyle.textStyleUtils400(
                                                color: Colors.red),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              0.0,
                                            ),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              0.0,
                                            ),
                                            borderSide: BorderSide.none),
                                        suffixIcon: null,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                            0.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45.h,
                                  child: CommonThemeButton(
                                    onTap: () {
                                      if (controller.showAppliedCoupons.value) {
                                        controller.deleteAppliedCoupon();
                                      } else {
                                        if (controller.formKey.currentState
                                                ?.validate() ??
                                            false) {
                                          controller.addCouponsToCartForField();
                                        }
                                      }
                                    },
                                    title: controller.showAppliedCoupons.value
                                        ? LanguageConstants.removeCoupon.tr
                                        : LanguageConstants.applyText.tr,
                                  ),
                                )
                              ],
                            ),
                          ),

                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showAllCouponsList(controller);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: CommonTextPoppins(
                            LanguageConstants.viewCouponList.tr,
                            fontWeight: FontWeight.w400,
                            color: appColorButton,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      (controller.cartModel.value.items?.isEmpty ?? false)
                          ? Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30,
                                top: 20,
                              ),
                              child: Text(
                                LanguageConstants
                                    .youHaveNoItemsInYourShoppingCart.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400(
                                    size: 16, color: regularGrey),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 20,
                      ),
                      // const Divider(color: regularGrey),
                      (controller.cartModel.value.items?.isNotEmpty ?? false)
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: homeBackground,
                                    border:
                                        Border.all(color: appTileBorderColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 45.h,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: appColorButton2,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15.w),
                                          child: CommonTextPoppins(
                                            LanguageConstants.itemText.tr,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            color: appColorButton,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.w),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguageConstants.subTotal.tr,
                                                style:
                                                    AppStyle.textStyleUtils400(
                                                  size: 16.0,
                                                ),
                                              ),
                                              Text(
                                                controller.getTotalsData.value
                                                        .getSubTotal() ??
                                                    '',
                                                style:
                                                    AppStyle.textStyleUtils400(
                                                  size: 16.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  LanguageConstants
                                                      .orderTotalText.tr,
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                    size: 16.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  controller.getTotalsData.value
                                                          .getGrandTotal() ??
                                                      '',
                                                  style: AppStyle
                                                      .textStyleUtils400(
                                                    size: 16.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 45.w,
                                              child: CommonThemeButton(
                                                onTap: () async {
                                                  await Get.toNamed<dynamic>(
                                                    RoutesConstants
                                                        .checkoutOrderScreen,
                                                    arguments: controller
                                                        .cartModel.value,
                                                  );
                                                  controller.getTotals();
                                                },
                                                title: LanguageConstants
                                                    .goToCheckOut.tr,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: SizedBox(
                                  child: CommonThemeButton(
                                onTap: () {
                                  Get.back<dynamic>();
                                },
                                title: LanguageConstants.continueShopping.tr,
                              )),
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      // ignore: prefer_const_constructors
                      if (controller.donationList.isNotEmpty) DonateDesign(),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                  controller.isLoading.value
                      ? const ScreenLoading()
                      : const SizedBox(),
                ],
              ),
      ),
    );
  }
}
