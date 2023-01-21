import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDialog {
  static void showWishlistDialog(name, image) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.1,
                text: TextSpan(
                    text: LanguageConstants.youaddCartText.tr,
                    style: AppTextStyle.textStyleUtils400(size: 15),
                    children: <TextSpan>[
                      TextSpan(text: '$name', style: AppTextStyle.textStyleUtils500(size: 15)),
                      TextSpan(
                        text: LanguageConstants.toShoopingCartText.tr,
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                    ]),
              ),
              const SizedBox(height: 4.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.0,
                text: TextSpan(
                    text: LanguageConstants.totalText.tr,
                    style: AppTextStyle.textStyleUtils400(size: 15),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 4 ',
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                      TextSpan(
                        text: LanguageConstants.itemCartText.tr,
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                    ]),
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
                        border: Border.all(color: Colors.black12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider("$image"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(0), color: const Color(0xff000080)),
                              child: Text(
                                LanguageConstants.continueShoppingText.tr,
                                style: AppTextStyle.textStyleUtils500(size: 15, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesConstants.wishlistScreen);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(color: const Color(0xff000080)),
                                  color: Colors.white),
                              child: Text(
                                LanguageConstants.gotoWishListText.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleUtils500(color: const Color(0xff000080)),
                              ),
                            ),
                          ),
                        ],
                      )),
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
