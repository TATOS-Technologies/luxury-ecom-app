import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:veralusso/app/controller/my_orders/my_orders_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/my_order_widget.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  @override
  final MyOrdersController controller = Get.find();

  MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: LanguageConstants.myOrdersText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: blackColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 12.5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      controller.myOrdersModel.value.items == null ||
                              (controller.myOrdersModel.value.items?.isEmpty ?? false)
                          ? Container(
                              alignment: Alignment.center,
                              height: Get.height / 1.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const NothigToShowAnimationWidget(),
                                  SizedBox(height: 20.w,),

                                  Text(
                                    LanguageConstants.youHaveNoOrders.tr,
                                    style: AppTextStyle.normalRegular14,
                                  ),
                                  
                                  SizedBox(height: 20.w,),
                                  CommonThemeButton(
                                    onTap: () {
                                      Get.offAndToNamed(RoutesConstants.dashboardScreen);
                                    },
                                    title:
                                      LanguageConstants.continueShopping.tr,
                                      
                                  ),
                                  SizedBox(height: 60.w,),

                                ],
                              ),
                            )
                          : Container(
                              padding:  EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(width: 2,color: textFieldBoarderColor)),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  ParentItemElement item =
                                      (controller.myOrdersModel.value.items?[index].items?.isEmpty == true)
                                          ? ParentItemElement()
                                          : controller.myOrdersModel.value.items?[index].items?.first ??
                                              ParentItemElement();
                                  MyOrdersDataItem? orderData = controller.myOrdersModel.value.items?[index];
                                  return MyOrderWidget(item, orderData);
                                },
                                itemCount: controller.myOrdersModel.value.items?.length ?? 0,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
