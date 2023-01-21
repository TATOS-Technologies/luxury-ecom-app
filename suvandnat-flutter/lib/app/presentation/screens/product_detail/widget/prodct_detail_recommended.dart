import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductDetailRecommendedProducts
    extends GetView<ProductDetailController> {
  const ProductDetailRecommendedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.w,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 24.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.itemsData.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.recommendationOnTap(index);
          },
          child: Padding(
            padding:  EdgeInsets.only(right: 15.w),
            child: SizedBox(
              width: 146.w,
              height: 250.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 145.w,
                      width: 140.w,
                      // padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            height: 145.w,
                            width: 140.w,
                            image: NetworkImage(
                              controller.itemsData[index].imageUrl.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CommonTextPoppins(
                    controller.itemsData[index].name.toString(),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLine: 2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonTextPoppins(
                    controller.itemsData[index].price ?? '',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
