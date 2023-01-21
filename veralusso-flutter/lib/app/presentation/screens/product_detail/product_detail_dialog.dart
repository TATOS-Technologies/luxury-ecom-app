import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ProductDetailDialog {
  static void showAddToCartDialogBox(BuildContext context, name, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: whiteColor,
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 22,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  /* const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),*/
                  Expanded(
                    child: Text(
                      "${name!} ${LanguageConstants.addedToYourCart.tr}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: AppTextStyle.textStyleUtils500(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Container(
                      height: 200.w,
                      width: 200.w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(image),
                        ),
                      ),
                    ),
              const SizedBox(height: 14.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonThemeButton(
                        isOutLined: true,
                        buttonColor: whiteColor,
                        textColor: blackColor,
                        onTap: () {
                          Get.toNamed(RoutesConstants.cartScreen);
                        },
                        title:
                          LanguageConstants.viewCartText.tr,

                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CommonThemeButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title:
                          LanguageConstants.continueShopping.tr,

                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showWishlistDialog(BuildContext contex, name, String image) {
    showDialog(
      context: contex,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          // contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: whiteColor,
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      size: 22,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      "${LanguageConstants.youaddCartText.tr} ${name!} ${LanguageConstants.youaddCartEndText.tr}",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(image),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0),
                                          border: Border.all(color: blackColor)),
                                      child: Text(
                                        LanguageConstants.viewWishListText.tr,
                                        style: AppTextStyle.textStyleUtils500_12(),
                                      ),
                                    ),
                                    onTap: () {
                                      Get.toNamed(RoutesConstants.wishlistScreen);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: const Color(0xFFE8E8E8),
                                  ),
                                  child: Text(
                                    LanguageConstants.continueShoppingText.tr,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.textStyleUtils500_12(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
