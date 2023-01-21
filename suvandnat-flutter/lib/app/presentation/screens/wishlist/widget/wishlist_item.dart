// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_controller.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class WishlistItem extends GetView<WishlistController> {
  ItemProduct? item;
  int index;

  WishlistItem({Key? key, required this.item, required this.index})
      : super(key: key);

  final WishlistController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 210,
            child: Image.network(
              controller.productImage(index),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: greenC2ECFA,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(AppAsset.shoppingCartPng),
              ),
              Image(
                image: AssetImage(AppAsset.edit),
              ),
              Image(
                image: AssetImage(AppAsset.delete2),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${item!.product!.name}",
          textAlign: TextAlign.start,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        Text(
          "${item!.product!.name}",
          maxLines: 1,
          textAlign: TextAlign.start,
          style: AppTextStyle.textStyleUtils400(),
        ),
        Text(
          '\$ ' "${item!.product!.price}",
          maxLines: 1,
          textAlign: TextAlign.start,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ],
    );
  }
}
