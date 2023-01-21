import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:suvandnat/app/controller/search/search_controller.dart';
import 'package:suvandnat/app/presentation/screens/search/widget/product.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class SearchProductListWidget extends GetView<SearchController> {
  const SearchProductListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 96.h),
          child: Container(
            decoration: BoxDecoration(
              color: appColorPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8,
              ),
              child: Text(
                '${controller.productCount.value.toString()}/${(controller.searchItemList.value.totalCount ?? 0).toString()}',
                style: AppTextStyle.textStyleUtils400(
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                addAutomaticKeepAlives: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 27,
                  childAspectRatio: .70,
                ),
                itemCount: controller.productsList.length,
                itemBuilder: (_, index) {
                  ProductItem item = controller.productsList[index];
                  return Product(
                    item: item,
                    index: index,
                  );
                },
              ),
            ),
            controller.productLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: appColorPrimary,
                      size: 20.0,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
