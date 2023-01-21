import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailDialog {
  static void showDialogBox(
    BuildContext context,
    String name,
    String image,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: CommonAlertDialog(
            elevation: 6.0,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 0.0,
            ),
            contentWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          color: appColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14.0),
                  Text(
                    "$name ${LanguageConstants.addedYourCart.tr}",
                    style: AppTextStyle.textStyleUtils400(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(
                            14,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFbcbcbc),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                "$image",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                debugPrint("click");
                                Get.toNamed(
                                  RoutesConstants.cartScreen,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: appTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: CommonTextOpenSans(
                                LanguageConstants.viewCartText.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: appTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: CommonTextOpenSans(
                                LanguageConstants.continueShopping.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
