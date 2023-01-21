import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/consts/app_constants.dart';

class Product extends StatelessWidget {
  final ProductItem? item;
  final List<ProductItem>? itemList;

  const Product({Key? key, this.item, this.itemList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.productDetailsScreen, arguments: [item]);
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                border: Border.all(
                  color: appBorderColor,
                  width: 6,
                ),
              ),
              child: Image.network(
                "${AppConstants.productImageUrl}${item?.getProductImage()}",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                item?.getBrandName() ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils300_16()
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                "${item?.name}",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils300_16()
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            ),
            const SizedBox(height: 9),
            Center(
              child: Text(
                item?.extensionAttributes?.convertedRegularPrice ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils300(size: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
