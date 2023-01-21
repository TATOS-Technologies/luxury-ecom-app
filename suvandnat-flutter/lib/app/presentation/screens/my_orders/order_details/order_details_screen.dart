import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_orders/order_details/order_details_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../widgets/address_information_widget.dart';
import '../widgets/order_list_widget.dart';

class OrderDetailsScreen extends GetView<OrderDetailsController> {
  OrderDetailsScreen({Key? key}) : super(key: key);
  @override
  final OrderDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenD1F1FF,
        title: Text(
          LanguageConstants.orderDetails.tr,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ),
      backgroundColor: greenD1F1FF,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColorPrimary,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            TextSpan(
                              text: controller.myOrdersDataItem?.incrementId
                                  ?.toString(),
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        LanguageConstants.orderContain.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: blackColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const OrderListWidget(),
                      const SizedBox(
                        height: 30,
                      ),
                      const AddressInformationWidget(),
                      const SizedBox(height: 15),
                      const Divider(color: blackColor),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(LanguageConstants.paymentMethod.tr,
                              style: AppTextStyle.textStyleUtilsUnderLine18(
                                  thickness: 1)),
                          Text(LanguageConstants.cashOnDelivery.tr,
                              style: AppTextStyle.textStyleUtils400_16()),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: appColorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          Get.toNamed(RoutesConstants.dashboardScreen);
                        },
                        child: HeadlineBodyOneBaseWidget(
                          title: LanguageConstants.continueShopping.tr,
                          titleColor: Colors.white,
                          fontFamily: AppConstants.fontPoppins,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: appColorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          controller.showOrderTrackingDialogBox(context);
                        },
                        child: HeadlineBodyOneBaseWidget(
                          title: LanguageConstants.trackOrderText.tr,
                          titleColor: Colors.white,
                          fontFamily: AppConstants.fontPoppins,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
