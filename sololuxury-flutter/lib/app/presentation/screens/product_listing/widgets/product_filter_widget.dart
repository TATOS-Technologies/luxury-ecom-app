import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/product_listing/widgets/product_sort.dart';

import '../../../../../all_imports.dart';
import 'product_filter.dart';

class ProductFilterWidget extends GetView<ProductController> {
  const ProductFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 47.h,
            width: 160.w,
            decoration: BoxDecoration(
                color: const Color(0xfff3eae7), borderRadius: BorderRadius.circular(12)),
            child: MaterialButton(
              onPressed: () {
                showGeneralDialog(
                  context: Get.context!,
                  barrierColor: Colors.black12.withOpacity(0.6),
                  // Background color
                  barrierDismissible: false,
                  barrierLabel: 'Dialog',
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) {
                    return const ProductSort();
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAsset.svgSort,
                    width: 18.0,
                    height: 18.0,
                    color: appColor,
                  ),
                  const SizedBox(width: 24),
                  Text(
                    LanguageConstants.sort.tr,
                    style: AppStyle.textStyleUtils600_14(color: appColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 7.w,
          ),
          Container(
            height: 47.h,
            width: 160.w,
            decoration: BoxDecoration(
                color: const Color(0xfff3eae7), borderRadius: BorderRadius.circular(12)),
            child: MaterialButton(
              onPressed: () {
                // Get.toNamed<dynamic>(RoutesConstants.filterScreen);
                // controller.getSortedProducts();
                showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black12.withOpacity(0.6),
                  // Background color
                  barrierDismissible: false,
                  barrierLabel: 'Dialog',
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (_, __, ___) {
                    return const Scaffold(resizeToAvoidBottomInset: false, body: ProductFilter());
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAsset.svgfilter,
                    width: 18.0,
                    height: 18.0,
                    color: appColor,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    LanguageConstants.filter.tr,
                    style: AppStyle.textStyleUtils600_14(color: appColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
