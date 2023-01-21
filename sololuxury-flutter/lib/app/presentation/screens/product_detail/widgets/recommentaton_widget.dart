import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class RecommentationWidget extends GetView<ProductDetailController> {
  const RecommentationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.w,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 24.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: controller.itemsData.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.recommendationOnTap(index);
          },
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
                        color: productBG,
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
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
