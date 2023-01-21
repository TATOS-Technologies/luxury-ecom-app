import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/controller/my_orders/my_orders_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/screens/my_orders/widgets/my_order_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  MyOrdersScreen({Key? key}) : super(key: key);

  final MyOrdersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.myOrders.tr),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(color: appColorPrimary),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        controller.orderDataIsEmpty()
                            ? Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        LanguageConstants.youHaveNoOrders.tr,
                                        style: AppTextStyle.normalRegular14,
                                      ),
                                      const SizedBox(height: 10),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: appColorPrimary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.offAndToNamed(
                                              RoutesConstants.dashboardScreen);
                                        },
                                        child: HeadlineBodyOneBaseWidget(
                                          title: LanguageConstants
                                              .createAnAccountText.tr,
                                          titleColor: Colors.white,
                                          fontFamily: AppConstants.fontPoppins,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      ParentItemElement? item = controller
                                          .myOrdersModel
                                          .value
                                          .items![index]
                                          .items!
                                          .first;
                                      MyOrdersDataItem orderData = controller
                                          .myOrdersModel.value.items![index];
                                      return MyOrderWidget(item, orderData);
                                    },
                                    itemCount: controller
                                        .myOrdersModel.value.items!.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const Divider(
                                        height: 1,
                                        color: blackColor,
                                        thickness: 1,
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
