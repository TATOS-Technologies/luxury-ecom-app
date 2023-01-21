import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

import 'package:solo_luxury/app/presentation/common_widget/common_widget/custom_expansion_tile.dart'
    as custom;

class ShippingPageView extends GetView<ShippingController> {
  const ShippingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: homeBackground,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColor,
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.getShippingList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        debugPrint(
                            "DATADATA ========${controller.getShippingList[index].title.toString()}");
                        return Container(
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
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 20, top: 3),
                            title: Text(
                              controller.getShippingList[index].title
                                  .toString(),
                                  overflow: TextOverflow.ellipsis,
                              style: AppStyle.textStyleUtils500(size: 14.sp),
                            ),
                            isIcon: controller.getShippingList.isEmpty
                                ? true
                                : false,
                            children: [
                              Container(
                                width: Get.width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Html(
                                  data: controller
                                      .getShippingList[index].description
                                      .toString(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
