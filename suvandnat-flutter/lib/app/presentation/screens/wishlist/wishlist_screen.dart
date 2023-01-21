// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/wishlist/widget/wishlist.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class MyWishListPage extends GetView<WishlistController> {
  Function? backtoShop;

  final WishlistController controller = Get.find();

  MyWishListPage({Key? key, this.backtoShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        appBar: commonAppbar(title: LanguageConstants.wishList.tr),
        key: controller.scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xFF973133),
                  ),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: controller.isWishListEmpty()
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const NothigToShowAnimationWidget(),
                                  Text(
                                    LanguageConstants
                                        .youHaveNoProductsInYourWishList.tr,
                                    style: AppTextStyle.normalRegular14,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  CommonThemeButton(
                                    onTap: () {
                                      if (backtoShop != null) {
                                        backtoShop!("true");
                                      } else {
                                        Get.offAndToNamed(
                                            RoutesConstants.dashboardScreen);
                                      }
                                    },
                                    title:
                                        LanguageConstants.continueShopping.tr,
                                  ),
                                ],
                              ),
                            )
                          : const Wishlist(),
                    ),
                    controller.isScreenLoading.value
                        ? const ScreenLoading()
                        : const SizedBox.shrink()
                  ],
                ),
        ),
      ),
    );
  }
}
