import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import '../../../../core/consts/app_constants.dart';
import '../../../../core/utils/lang_directory/language_constant.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/colors.dart';

class WishlistItem extends StatelessWidget {
  final ItemProduct? item;

  const WishlistItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            height: 210,
            child: Image.network(
              "${AppConstants.productImageUrl}${item?.product?.customAttributes?.first.value}",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${item?.product?.name}",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils300_16(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$ ' "${item?.product?.price}",
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils600_16(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                color: blue367587,
                height: 30,
                elevation: 0,
                child: Text(
                  LanguageConstants.addToCart.tr,
                  style: AppTextStyle.textStyleUtils400(
                      size: Get.width >= 480 ? 14.0 : 10.0, color: whiteColor),
                ),
              ),
              Container(
                height: 31,
                width: 31,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: blue367587,
                    width: 1,
                  ),
                ),
                child: Text(
                  "1",
                  style: AppTextStyle.textStyleUtils400(),
                ),
              ),
              Image(
                image: AssetImage(AppAsset.edit),
              ),
              Image(
                image: AssetImage(AppAsset.deleteIcon),
                color: blackColor,
                height: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
