// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:meta_package/meta_package.dart';
// import 'package:veralusso/app/controller/product_detail/product_detail_controller.dart';
// import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
// import 'package:veralusso/app/theme/app_text_style.dart';
// import 'package:veralusso/app/theme/colors.dart';

// class ExpandDetailWidget extends GetView<ProductDetailController> {
//   @override
//   final ProductDetailController controller = Get.find();
//   ExpandDetailWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       iconColor: blackColor,
//       title: CommonTextPoppins(
//         LanguageConstants.details.tr,
//         color: blackColor,
//       ),
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 10),
//               controller.getComposition().isNotEmpty
//                   ? Text(
//                       "Composition : ${controller.getComposition()}",
//                       style: AppTextStyle.textStyleUtils500(
//                           size: 13, color: Colors.black54),
//                     )
//                   : const SizedBox.shrink(),
//               controller.getColor().isNotEmpty
//                   ? Text(
//                       "Color : ${controller.getColor()}",
//                       style: AppTextStyle.textStyleUtils500(
//                           size: 13, color: Colors.black54),
//                     )
//                   : const SizedBox.shrink(),
//               controller.getMaterial().isNotEmpty
//                   ? Text(
//                       "Material : ${controller.getMaterial()}",
//                       style: AppTextStyle.textStyleUtils500(
//                           size: 13, color: Colors.black54),
//                     )
//                   : const SizedBox.shrink(),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
