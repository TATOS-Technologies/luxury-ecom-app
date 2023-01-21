import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_routes.dart';

class SearchDialog {
  static void showWishlistDialog(String name, String image) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(
            14.0,
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          backgroundColor: const Color(
            0xffedf8fe,
          ),
          contentWidget: Column(
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
                      color: avoirChickTheme,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              Text(
                LanguageConstants.youaddCartText.tr,
                style: AppTextStyle.textStyleUtils400(),
              ),
              Text(
                name,
                style: AppTextStyle.textStyleUtils700(),
              ),
              Text(
                LanguageConstants.youaddCartEndText.tr,
                style: AppTextStyle.textStyleUtils400(),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Container(
                    height: 160.w,
                    width: 160.w,

                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(
                      14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  CommonThemeButton(
                    isOutLined: true,
                    buttonColor: whiteColor,
                    textColor: primary,
                    title: LanguageConstants.viewWishListText.tr,
                    onTap: () {
                      Get.toNamed(
                        RoutesConstants.wishlistScreen,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  CommonThemeButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: LanguageConstants.continueShoppingText.tr,
                  ),
                  
                  
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        );
      },
    );
  }
}
