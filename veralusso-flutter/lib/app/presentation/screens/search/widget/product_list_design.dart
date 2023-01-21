import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ProductListDesign extends StatelessWidget {
  final ProductItem product;

  const ProductListDesign({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 210,
            //padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: appColor,
                width: 1.4,
              ),
            ),
            child: Stack(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "${AppConstants.productImageUrl}${product.attributeSetId}",
                  height: 210,
                  width: 210,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        AppAsset.heart,
                        height: 14,
                        color: appColor,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "${product.name}",
            style: AppTextStyle.textStyleUtils500_16()
                .copyWith(overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' "${product.price}",
                  style: AppTextStyle.textStyleUtils500_16()),
              Text(
                '\$' "${product.price}",
                style: AppTextStyle.textStyleUtils500_16(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
