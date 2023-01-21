import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/product_listing/product_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/widget/product_item.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductListScreen extends GetView<ProductController> {
  ProductListScreen({Key? key}) : super(key: key);

  @override
  final ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CommonBacground(
        child: Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: commonAppbar(
              title: controller.title.value, appBarColor: Colors.transparent),
          body: Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(color: appColorPrimary),
                  )
                : Stack(
                    children: [
                      NotificationListener<ScrollNotification>(
                        onNotification: controller.scrollNotificationData,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.5,
                          ),
                          child: Column(
                            children: const [
                              SizedBox(
                                height: 15,
                              ),
                              ProductItemWidget(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      controller.visibleLoader.value
                          ? const ScreenLoading()
                          : const SizedBox.shrink(),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
