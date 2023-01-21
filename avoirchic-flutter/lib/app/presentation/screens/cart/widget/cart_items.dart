import 'package:avoirchic/app/controller/cart_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/constants/key_value_constants.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../common_widgets/alert_dialog/common_alert_dialog.dart';

class CartItems extends GetView<CartController> {
  const CartItems({Key? key}) : super(key: key);

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 1)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextPoppins(
                LanguageConstants.itemText.tr,
                color: primary,
                fontSize: 16.sp,
              ),
            ),
          ),
          const Divider(color: borderGrey, height: 1, thickness: 1),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.cartModel.value.items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final list = controller.cartModel.value.items![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  left: 10.w,
                                  top: 10.w,
                                ),
                                width: 91.w,
                                height: 97.w,
                                // padding: const EdgeInsets.only(
                                //   bottom: 15,
                                // ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CachedNetworkImage(
                                  width: 65.w,
                                  fit: BoxFit.cover,
                                  imageUrl: controller.getProductImage(index),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Lottie.asset(
                                    'assets/json/loader.json',
                                    width: 65,
                                  ),
                                  errorWidget: (context, url, error) => Image(
                                    image: AssetImage(AppAsset.logo),
                                  ),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 10),
                                    child: Text(
                                      firstCapitalize(
                                        controller.cartModel.value.items?[index]
                                                .name
                                                ?.toString() ??
                                            '',
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: AppTextStyle.textStyleUtils500(
                                          size: 14.sp),
                                    ),
                                  ),
                                  Text(
                                    controller.cartModel.value.items?[index].sku
                                            ?.toString() ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AppTextStyle.textStyleUtils400(),
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
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
                                                              .items?[index]
                                                              .sku ??
                                                          ''
                                                });
                                          },
                                          child:
                                              const Icon(Icons.edit_outlined)),
                                      InkWell(
                                          onTap: () {
                                            confirmationDialogForRemoveCartProduct(
                                                index, context);
                                          },
                                          child:
                                              const Icon(Icons.delete_outlined))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LanguageConstants.qtyText.tr,
                              style: AppTextStyle.textStyleUtils500(
                                  color: primary, size: 14.sp),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.checkForEmptyDeletation(
                                    index, context);
                              },
                              child: Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: primary),
                                child: const Icon(
                                  Icons.remove,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              list.qty.toString(),
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                controller.increaseProductQty(index);
                                // controller.
                              },
                              child: Container(
                                width: 18.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: primary),
                                child: const Icon(
                                  Icons.add,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              LanguageConstants.subTotal.tr,
                              style: AppTextStyle.textStyleUtils500(
                                  color: primary, size: 14.sp),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              localStore.getRegularPriceWithCurrency(
                                list.price.toString(),
                                list.price.toString(),
                              ),
                              style: AppTextStyle.textStyleUtils600(
                                  color: blackColor, size: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> confirmationDialogForRemoveCartProduct(
      int index, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return CommonAlertDialog(
            elevation: 6.0,
            radius: 0,
            titleWidget: Text(LanguageConstants.removeProduct.tr,
                style: AppTextStyle.textStyleUtils700_16()),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    LanguageConstants
                        .areYouSureWantToRemoveThisProductFromCart.tr,
                    style: AppTextStyle.textStyleUtils400_16()),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColor),
                        child: Text(
                          LanguageConstants.yes.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        controller.deleteProductFun(index);
                      },
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appColor),
                        child: Text(
                          LanguageConstants.no.tr,
                          style: AppTextStyle.textStyleUtils400(
                              size: 15, color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
