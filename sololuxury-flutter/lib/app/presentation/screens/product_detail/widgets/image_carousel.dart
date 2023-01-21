import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/widgets/all_product_image.dart';

import '../../../../../all_imports.dart';

class ImageCarousel extends GetView<ProductDetailController> {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      decoration: const BoxDecoration(
        color: Color(0xfffffcf9),
        // border: Border.all(color: Colors.black, width: 1),
      ),
      child: Stack(
        children: [
          Obx(
            () => PageView.builder(
              controller: controller.controllerPage,
              itemBuilder: (_, index) {
                MediaGalleryEntry? item =
                    controller.product?.value.mediaGalleryEntries?[index];
                return GestureDetector(
                  onTap: () {
                    imagePreview(
                        "${AppConstants.productImageUrl}${item?.file}");
                    // Get.to<dynamic>(FullScreenImage(
                    //   imageUrl: AppConstants.productImageUrl + item.file.toString(),
                    //   tag: "tag",
                    // ));
                  },
                  //Hero tag: "tag",

                  child: Image.network(
                    "${AppConstants.productImageUrl}${item?.file}",
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount:
                  controller.product?.value.mediaGalleryEntries?.length ?? 0,
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppAsset.search,
                  height: 24,
                  color: Colors.black45,
                )),
          ),*/
          // const SizedBox(
          //   height: 97,
          // ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left:0, right: 0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             controller.controllerPage.previousPage(
          //               duration: const Duration(milliseconds: 300),
          //               curve: Curves.ease,
          //             );
          //           },
          //           child: const Icon(
          //             Icons.arrow_back_ios,
          //             size: 20,
          //             color: Colors.black54,
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             controller.controllerPage.nextPage(
          //               duration: const Duration(milliseconds: 300),
          //               curve: Curves.ease,
          //             );
          //           },
          //           child: const Icon(
          //             Icons.arrow_forward_ios,
          //             size: 20,
          //             color: Colors.black54,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          const Align(
            alignment: Alignment(0, .9),
            child: AllProductImages(),
          ),
        ],
      ),
    );
  }
}

Future<void> imagePreview(String imageUrl) {
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
            //hero => tag: "tag",
            child: PhotoView(
              customSize: MediaQuery.of(Get.context!).size,
              initialScale: PhotoViewComputedScale.contained,
              imageProvider: NetworkImage(imageUrl),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1.8,
            ),
          ),
          GestureDetector(
            onTap: () => Get.back<dynamic>(),
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
