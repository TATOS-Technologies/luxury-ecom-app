import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/product/product_model.dart';

import '../../../../../all_imports.dart';

class AllProductImages extends GetView<ProductDetailController> {
  const AllProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: controller.getMediaGalleryEntriesLenght(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          MediaGalleryEntry? item =
              controller.product?.value.mediaGalleryEntries?[index];
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: GestureDetector(
                  onTap: () {
                    controller.frameIndex.value = index;
                    controller.controllerPage.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Obx(
                    () => Opacity(
                      opacity: controller.frameIndex.value == index ? 1 : .4,
                      child: Container(
                        width: 46.w,
                        height: 46.w,
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                            color: appTileColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Image.network(
                          "${AppConstants.productImageUrl}${item?.file}",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
