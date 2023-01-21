import 'package:avoirchic/app/controller/wishlist_controller.dart';
import 'package:avoirchic/app/presentation/screens/wishlist/widget/list_item.dart';
import 'package:avoirchic/app/presentation/screens/wishlist/widget/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class MyWishListPage extends GetView<WishlistController> {
  final Function? backToShop;

  const MyWishListPage({Key? key, this.backToShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(LanguageConstants.myWishlistText.tr),
      ),
      key: controller.scaffoldKey,
      body: Obx(
        () => controller.isLoading.value
            ? const SpinnerWidget()
            : Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 60, left: 20, right: 20, bottom: 30),
                      child: ListItem(backToShop),
                    ),
                  ),
                  controller.isScreenLoading.value
                      ? const SpinnerWidget()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }
}
