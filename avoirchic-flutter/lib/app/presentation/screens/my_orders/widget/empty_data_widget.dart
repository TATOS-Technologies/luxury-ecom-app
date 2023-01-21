import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/my_orders_controller.dart';
import '../../../../core/utils/app_routes.dart';

class EmptyDataWidget extends GetView<MyOrdersController> {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            LanguageConstants.youHaveNoOrders.tr,
            style: AppTextStyle.normalRegular16,
          ),
          const SizedBox(height: 10),
          CommonThemeButton(
              onTap: () {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              },
              title: LanguageConstants.continueShopping.tr),
          SizedBox(
            height: 80.h,
          )
        ],
      ),
    );
  }
}
