import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';
import 'product_filter_option_list.dart';

class ProductFilter extends GetView<ProductController> {
  const ProductFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: Get.height,
      width: Get.width,
      color: backGroundColor,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonAppbarDialog(
                title: LanguageConstants.filtersText.tr,
                onTapRefresh: () {
                  Get.back<dynamic>();
                  controller.onInit();
                },
                color: appColorPrimary,
              ),
              const ProductFilterOptionList(),
              SizedBox(
                height: 54.h,
              ),
              SizedBox(
                child: CommonThemeButton(
                  onTap: () {
                    controller.onFilterClick();
                  },
                  title: LanguageConstants.applyText.tr,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
