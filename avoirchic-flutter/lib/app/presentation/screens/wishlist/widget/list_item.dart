import 'package:avoirchic/app/controller/wishlist_controller.dart';
import 'package:avoirchic/app/presentation/screens/wishlist/widget/wishlist_data_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'empty_data_widget.dart';

class ListItem extends GetView<WishlistController> {
  final Function? backToShop;

  const ListItem(this.backToShop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isWishListEmpty()
        ? EmptyDataWidget(backToShop)
        : const WishlistDataItem();
  }
}
