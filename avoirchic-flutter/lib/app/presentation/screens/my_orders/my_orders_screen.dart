import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/screens/my_orders/widget/empty_data_widget.dart';
import 'package:avoirchic/app/presentation/screens/my_orders/widget/my_order_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import '../../../controller/my_orders_controller.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(
                    0xff367587,
                  ),
                  // size: 50.0,
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: Text(
                    LanguageConstants.myOrdersText.tr,
                    style: AppTextStyle.textStyleUtils500_16(),
                  ),
                ),
                key: controller.scaffoldKey.value,
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      controller.myOrdersModel?.value.items?.isEmpty ?? true
                          ? const Expanded(child: EmptyDataWidget())
                          : Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  ParentItemElement? item = controller
                                      .myOrdersModel!
                                      .value
                                      .items![index]
                                      .items!
                                      .first;
                                  MyOrdersDataItem orderData = controller
                                      .myOrdersModel!.value.items![index];
                                  return MyOrderWidget(
                                        item: item, orderData: orderData);
                                },
                                itemCount: controller
                                    .myOrdersModel!.value.items!.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                      color: whiteColor, thickness: 1);
                                },
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
