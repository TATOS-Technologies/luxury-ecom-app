// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/meta_package.dart';

import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../../theme/app_asset.dart';

class MostPopularWidget extends StatelessWidget {
  final String id;
  final String title;
  final ProductModel? productModel;
  final bool isEmpty;
  const MostPopularWidget({
    Key? key,
    required this.id,
    required this.title,
    this.productModel,
    required this.isEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return isEmpty
        ? const SizedBox()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(title,
                        style: AppStyle.textStyleUtils600(
                            size: 18.w, color: blackColor)),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Get.toNamed<dynamic>(
                            RoutesConstants.productListScreen,
                            arguments: [
                              "dash",
                              id, // countryInsideList.attributeId, for designer brand
                              title, // brand name
                            ],
                          );
                        },
                        child: Text(
                          LanguageConstants.viewAll.tr,
                          style: AppStyle.textStyleUtils400(
                              color: blackColor),
                        )),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productModel!.items!.length > 4
                        ? 4
                        : productModel!.items!.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8.w,
                      crossAxisCount: 2,
                      childAspectRatio: .7,
                    ),
                    itemBuilder: (context, index) {
                      ProductItem? item = productModel!.items![index];
                      //trending product tile
                      return Padding(
                        padding: EdgeInsets.all(4.sp),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed<dynamic>(
                              RoutesConstants.productDetailsScreen,
                              arguments: [item],
                            );
                          },
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 148.w,
                                  width: 156.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppConstants.productImageUrl}""${productModel!.items![index].mediaGalleryEntries!.isEmpty?'':productModel!.items![index].mediaGalleryEntries!.first.file}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                        color: const Color(0xfffffcf9)
                                            .withOpacity(0.5)),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AppAsset.logo,
                                      color: const Color(0xfffffcf9),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  productModel!.items![index].name!.toString(),
                                  style: AppStyle.textStyleUtils400(size: 12.sp),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  '\$ ${productModel!.items![index].price.toString()}',
                                  style: AppStyle.textStyleUtils600(size: 12.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
  }
}
