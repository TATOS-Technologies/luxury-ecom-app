import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class WishlistDialog extends StatelessWidget {
  const WishlistDialog({Key? key, this.dataName, this.customImage})
      : super(key: key);

  final String? dataName;
  final String? customImage;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      elevation: 6.0,
      radius: 0,
      contentPadding: const EdgeInsets.all(14.0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      backgroundColor: whiteColor,
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
                  color: blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          Text(
            "${LanguageConstants.youaddCartText.tr} $dataName ${LanguageConstants.youaddCartEndText.tr}",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(size: 15),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(customImage ?? ''),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonThemeButton(
                title: LanguageConstants.viewCartText.tr.toUpperCase(),
                onTap: () {
                  debugPrint("click");
                  Get.toNamed(RoutesConstants.cartScreen);
                },
              ),
              SizedBox(
                width: 20.w,
              ),
              CommonThemeButton(
                isOutLined: true,
                buttonColor: whiteColor,
                textColor: blackColor,
                onTap: () {
                  Navigator.pop(context);
                },
                title: LanguageConstants.continueShoppingText.tr.toUpperCase(),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
        ],
      ),
    );
  }
}
