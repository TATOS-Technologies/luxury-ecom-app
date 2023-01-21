import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class ExpandDetail extends StatelessWidget {
  const ExpandDetail(
      {Key? key,
      required this.text,
      required this.value,
      required this.controller})
      : super(key: key);
  final String text;
  final int value;
  final BrandController controller;

  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
              color: appTileBGcolor,
              border: Border.all(color: appBorderColor),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 8.w,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  InkWell(
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(text,
                              style: AppTextStyle.textStyleUtils600(
                                  size: 20.sp, color: appDarkText)),
                          // controller.index.value == value ? const Icon(Icons.remove, color: appColor) : const Icon(Icons.add, color: appColor),
                        ],
                      ),
                    ),
                    onTap: () {
                      debugPrint("onTap");
                      if (controller.index.value == value) {
                        controller.index.value = 0;
                      } else {
                        controller.index.value = value;
                      }
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: appDivderGrey,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.getBrandListlengthForBrandPage(text),
                        itemBuilder: (BuildContext context, int index) {
                          debugPrint("text is character $text");
                          final BrandModel countryInsideList =
                              controller.isSearchEnable.value
                                  ? controller.testDataList2[index]
                                  : controller.listDisplay(text)[index];
                          debugPrint(
                              "list is character ${countryInsideList.name}");
                          return InkWell(
                            onTap: () {
                              debugPrint(
                                  "this is list display ${countryInsideList.attributeId}");
                              Get.toNamed<dynamic>(
                                RoutesConstants.productListScreen,
                                arguments: [
                                  "brand",
                                  countryInsideList.attributeId,
                                  countryInsideList.name,
                                ],
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(),
                              ),
                              child: Text(
                                firstCapitalize(countryInsideList.name),
                                // "${countryInsideList.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: appDarkText,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (controller.listDisplay(text).length > 10)
                        InkWell(
                          onTap: () {
                            debugPrint(
                                "${controller.listDisplay(text).length}");
                            controller.brandDetails.value = text;
                            Get.to<dynamic>(() => const BrandDetailsPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Text(
                              LanguageConstants.andMore.tr,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: appDarkText,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
