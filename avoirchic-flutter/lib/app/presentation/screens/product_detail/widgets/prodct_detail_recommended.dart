import 'package:avoirchic/app/controller/product_detail_controller.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailRecommendedProducts
    extends GetView<ProductDetailController> {
  const ProductDetailRecommendedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 24.w),
        scrollDirection: Axis.horizontal,
        itemCount: controller.itemsData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              await controller.recommendationProductOnTap(index);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: SizedBox(
                width: 145.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 151.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.itemsData[index].imageUrl ?? '',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment(.8, -.8),
                        child: Icon(
                          Icons.favorite_border,
                          color: iconBlueColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      controller.itemsData[index].name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.textStyleUtils500(size: 12.sp),
                    ),
                    Text(
                      "${controller.itemsData[index].price}",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils600(size: 12.w),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
