// ignore_for_file: must_be_immutable

import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import '../../../../main/main.common.dart';
import '../../../../core/consts/app_constants.dart';
import '../../../../core/utils/app_routes.dart';

class Product extends StatelessWidget {
  ProductItem? item;
  List<ProductItem>? itemList = [];

  Product({Key? key, this.item, this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailScreen, arguments: [item]);
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColor,
                  width: 1.4,
                ),
              ),
              child: Image.network(
                "${AppConstants.productImageUrl}${item?.getProductImage()}",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item?.getBrandName() ?? '',
              style: AppTextStyle.textStyleUtils400_16()
                  .copyWith(overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${item?.name}".toUpperCase(),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.textStyleUtils400_16()
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  localStore.getRegularPriceWithCurrency(
                    item!
                        .getPriceFromConfigurableProduct(itemList, item)
                        .toString(),
                    item?.getConvertRegularPriceFromConfigurableProduct() ?? '',
                  ),
                  style: AppTextStyle.textStyleUtils600_16()
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(width: 50),
                Text(
                  '${item?.extensionAttributes?.convertedRegularOldPrice}',
                  style:
                      AppTextStyle.textStyleUtils400_16(color: Colors.black45)
                          .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addToCartButton() {
    return Container(
      height: 31,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          LanguageConstants.addTOCart.tr,
          style: AppTextStyle.textStyleUtils300(
            size: 15,
          ),
        ),
      ),
    );
  }

  Widget addToWishlistButton() {
    return Container(
      height: 31,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite_border,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
