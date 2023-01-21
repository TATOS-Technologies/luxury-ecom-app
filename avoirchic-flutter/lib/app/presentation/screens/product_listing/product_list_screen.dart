import 'dart:ui';

import 'package:avoirchic/app/controller/product_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/screens/product_listing/widget/product_item.dart';
import 'package:avoirchic/app/presentation/screens/product_listing/widget/product_shop.dart';
import 'package:avoirchic/app/presentation/screens/product_listing/widget/product_sort.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      key: controller.scaffoldKey,
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          commonAppbar(
            title: controller.title.value,
            appBarColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(Get.context!).viewPadding.top + 50.0,
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.5,
                ),
                child: Obx(() {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      controller.itemList.isNotEmpty
                          ? Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                SortByWidget(),
                                ShopByWidget(),
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Obx(
                          () => controller.isLoading.value
                              ? const Center(
                                  child: SpinKitThreeBounce(
                                    color: Color(0xff367587),
                                    // size: 50.0,
                                  ),
                                )
                              : const ProductItemWidget(),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  );
                })),
          ),
        ],
      ),
    );
  }
}
