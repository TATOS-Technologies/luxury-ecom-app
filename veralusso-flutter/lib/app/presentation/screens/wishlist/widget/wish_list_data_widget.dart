import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/wishlist/wishlist_controller.dart';

import 'wishlist_item.dart';

class WishListDataWidget extends GetView<WishlistController> {
  WishListDataWidget({Key? key}) : super(key: key);

  @override
  final WishlistController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      addAutomaticKeepAlives: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio:.60,
      ),
      itemBuilder: (_, index) {
        return WishlistItem(
          index: index,
        );
      },
      itemCount: controller.wishItemModel.value.items?.length,
    );
  }
}
