import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class SearchDialog {
  static void showWishlistDialog(String dataName, String customImage) {
    showDialog<dynamic>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CommonAlertDialog(
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
                "${LanguageConstants.youaddCartText.tr} $dataName ${LanguageConstants.youaddWishEndText.tr}",
                textAlign: TextAlign.center,
                style: AppStyle.textStyleUtils400(size: 15, color: appColor),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Container(
                    height: 90.w,
                    width: 90.w,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          customImage,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      children: [
                        CommonThemeButton(
                          title:
                              LanguageConstants.viewWishListText.tr,
                              
                          onTap: () {
                            Get.toNamed<dynamic>(
                              RoutesConstants.wishlistScreen,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        CommonThemeButton(
                          onTap: () {
                            Get.back<dynamic>();
                          },
                          
                            title:  LanguageConstants.continueShoppingText.tr,
                             
                          
                        ),
                      ],
                    ),
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
