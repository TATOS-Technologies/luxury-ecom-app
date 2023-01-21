import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/wishlist/wishlist_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/presentation/screens/wishlist/widget/wish_list_data_widget.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widget/empty_data_widget.dart';

class MyWishListPage extends GetView<WishlistController> {
  final Function? backtoShop;

  MyWishListPage({Key? key, this.backtoShop}) : super(key: key);

  @override
  final WishlistController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: whiteColor,
      appBar: commonAppbar(title:LanguageConstants.myWidhListText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: blackColor,
                ),
              )
            : Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: controller.isWishListEmpty()
                          ? EmptyDataWidget(
                              backtoShop: backtoShop,
                            )
                          : WishListDataWidget()),
                  controller.isScreenLoading.value
                      ? const ScreenLoading()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }
}
