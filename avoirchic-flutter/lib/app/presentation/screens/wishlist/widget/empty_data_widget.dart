import 'package:avoirchic/app/controller/wishlist_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../theme/app_text_style.dart';

class EmptyDataWidget extends GetView<WishlistController> {
  final Function? backToShop;

  const EmptyDataWidget(this.backToShop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            LanguageConstants.youHaveNoProductsInYourWishList.tr,
            style: AppTextStyle.normalRegular14,
          ),
          const SizedBox(height: 20),
          CommonThemeButton(
            onTap: () {
              if (backToShop != null) {
                backToShop!("true");
              } else {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              }
            },
            title: LanguageConstants.continueShopping.tr,
          ),
          SizedBox(
            height: 90.h,
          )
        ],
      ),
    );
  }
}
