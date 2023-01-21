import 'package:avoirchic/app/controller/product_detail_controller.dart';
import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:photo_view/photo_view.dart';

class ProductImageCarosal extends GetView<ProductDetailController> {
  const ProductImageCarosal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.w,
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => PageView.builder(
                onPageChanged: (value) {
                  controller.frameIndex.value = value;
                },
                controller: controller.controllerPage,
                itemBuilder: (_, index) {
                  MediaGalleryEntry item =
                      controller.product!.value.mediaGalleryEntries![index];
                  return GestureDetector(
                    onTap: () {
                      imagePreview(
                        "${AppConstants.productImageUrl}${item.file}",
                      );
                    },
                    child: Hero(
                        tag: "tag",
                        child: Image.network(
                          "${AppConstants.productImageUrl}${item.file}",
                          fit: BoxFit.cover,
                        )),
                  );
                },
                itemCount:
                    controller.product!.value.mediaGalleryEntries?.length ?? 0,
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.w),
              child: SizedBox(
                height: 46.w,
                child: ListView.builder(
                  itemCount:
                      controller.product!.value.mediaGalleryEntries!.length,
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
                                    : .4,
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
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width:
                                          controller.frameIndex.value == index
                                              ? 1.4
                                              : 1,
                                      color: iconBlueColor,
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
          // const SizedBox(
          //   height: 97,
          // ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 8.0, right: 8),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             controller.controllerPage.previousPage(
          //               duration: const Duration(
          //                 milliseconds: 300,
          //               ),
          //               curve: Curves.ease,
          //             );
          //           },
          //           child: const Icon(
          //             Icons.arrow_back_ios,
          //             size: 20,
          //             color: Colors.black,
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             controller.controllerPage.nextPage(
          //               duration: const Duration(
          //                 milliseconds: 300,
          //               ),
          //               curve: Curves.ease,
          //             );
          //           },
          //           child: const Icon(
          //             Icons.arrow_forward_ios,
          //             size: 20,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
      transitionDuration: const Duration(
        milliseconds: 400,
      ),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Stack(
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
          ),
        );
      },
    );
  }
}
