import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductDialog {
  static showAddDialog(String dataname, String customimage) {
    Get.dialog(
      CommonAlertDialog(
        elevation: 6.0,
        radius: 0,
        contentPadding: const EdgeInsets.all(14.0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        backgroundColor: const Color(0xffFBECE5),
        contentWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.clear,
                    size: 22,
                    color: appColorPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Text(
              "${LanguageConstants.youaddCartText.tr} $dataname ${LanguageConstants.youaddCartEndText.tr}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: appColorPrimary),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColorPrimary),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          "${AppConstants.productImageUrl}$customimage",
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0,
                                    vertical: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: appColorPrimary,
                                  ),
                                  child: Text(
                                    LanguageConstants.viewCartText.tr.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Get.toNamed(RoutesConstants.cartScreen);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: Get.back,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: appColorPrimary,
                              ),
                              child: Text(
                                LanguageConstants.continueShoppingText.tr.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
