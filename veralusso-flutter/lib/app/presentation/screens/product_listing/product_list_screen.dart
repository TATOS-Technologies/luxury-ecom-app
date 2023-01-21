import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/product_listing/product_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/filter_drop_down.dart';
import 'widgets/product_list_widget.dart';

class ProductListScreen extends GetView<ProductController> {
  @override
  final ProductController controller = Get.find();

  ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: commonAppbar(title: controller.title.value),
        backgroundColor: whiteColor,
        body: controller.isLoading.value
            ? const Center(child: SpinKitThreeBounce(color: blackColor))
            : Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                    onNotification: controller.scrollNotificationData,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.5),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          FilterDropDown(),
                          const SizedBox(height: 20),
                          ProductListWidget(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  controller.visibleLoader.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
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
