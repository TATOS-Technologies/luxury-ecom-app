import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:suvandnat/app/controller/product_detail/product_detail_controller.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/theme/colors.dart';

class ProductImageCarosal extends GetView<ProductDetailController> {
  const ProductImageCarosal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.w,
      width: Get.width,
      color: Colors.white,
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => PageView.builder(
                controller: controller.controllerPage,
                itemBuilder: (_, index) {
                  MediaGalleryEntry item =
                      controller.product!.value.mediaGalleryEntries![index];
                  return GestureDetector(
                    onTap: () {
                      imagePreview(
                          "${AppConstants.productImageUrl}${item.file}");
                    },
                    child: Hero(
                        tag: "tag",
                        child: Image.network(
                          "${AppConstants.productImageUrl}${item.file}",
                          fit: BoxFit.fill,
                        )),
                  );
                },
                itemCount:
                    controller.product!.value.mediaGalleryEntries?.length ?? 0,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: SizedBox(
                height: 46.w,
                child: ListView.builder(
                  itemCount:
                      controller.product!.value.mediaGalleryEntries?.length ??
                          0,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    MediaGalleryEntry item =
                        controller.product!.value.mediaGalleryEntries![index];
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.frameIndex.value = index;
                            controller.controllerPage.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          child: Obx(() => Opacity(
                                opacity: controller.frameIndex.value == index
                                    ? 1
                                    : .6,
                                child: Container(
                                  width: 46.w,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${AppConstants.productImageUrl}${item.file}",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                      width:
                                          controller.frameIndex.value == index
                                              ? 1.2.w
                                              : 1.w,
                                      color: appColorPrimary,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future imagePreview(String imageUrl) {
    return showGeneralDialog(
      context: Get.context!,
      barrierColor: Colors.black12.withOpacity(0.6),
      // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            Center(
              child: Hero(
                  tag: "tag",
                  child: PhotoView(
                    customSize: MediaQuery.of(Get.context!).size,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider: NetworkImage(imageUrl),
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 1.8,
                  )),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 80,
                color: Colors.transparent,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 30,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
