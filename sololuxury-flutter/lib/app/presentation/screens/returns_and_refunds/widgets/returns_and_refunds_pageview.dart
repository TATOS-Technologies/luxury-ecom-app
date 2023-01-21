import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

import 'package:solo_luxury/app/presentation/common_widget/common_widget/custom_expansion_tile.dart'
    as custom;

class ReturnsAndRefundsPageView extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              LanguageConstants.returnsRefundsTitle.tr,
              style: AppStyle.textStyleUtils600(color: appColorButton, size: 20.sp)
                  .copyWith(
                decoration: TextDecoration.underline,
                decorationColor: appColor.withOpacity(0.25),
                decorationThickness: 1.5,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getReturnsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                debugPrint(
                    "DATADATA ========${controller.getReturnsList[index].title.toString()}");
                return Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: custom.ExpansionTile(
                    tileHeight: 48,
                    verticalVisualDensity: -1,
                    contentPadding:
                        const EdgeInsets.only(left: 20, right: 20, top: 3),
                    title: Text(
                      controller.getReturnsList[index].title.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:  AppStyle.textStyleUtils500(size: 14.sp),
                    ),
                    isIcon: controller.getReturnsList.isEmpty ? true : false,
                    children: [
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Html(
                          data: controller.getReturnsList[index].description
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
