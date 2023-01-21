import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/brand_list/brand_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../../common_widget/common_animations/nothing_to_show_animation.dart';
import '../../../common_widget/headline_body_one_base_widget.dart';

class EmptyDataWidget extends GetView<BrandController> {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const NothigToShowAnimationWidget(),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.searchController.text,
                      style: AppTextStyle.textStyleUtils700(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                textScaleFactor: 1,
                text: TextSpan(
                  text: LanguageConstants
                      .ifYouWouldLikeToHaveMoreInformationAbout.tr,
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: controller.searchController.text,
                      style: AppTextStyle.textStyleUtils700(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                LanguageConstants.thenPleaseCreateATicket.tr,
                style: AppTextStyle.textStyleUtils500(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: appColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(
                        RoutesConstants.specialRequestScreen,
                        arguments: [
                          controller.searchController.text,
                          "brand",
                        ],
                      );
                    },
                    child: HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.createTicket.tr,
                      titleColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: appColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.continueShoppingTap();
                    },
                    child: HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.continueShopping.tr,
                      titleColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
