import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

class BrandScrollList extends GetView<BrandController> {
  const BrandScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
        thickness: MaterialStateProperty.all(1),
        trackBorderColor: MaterialStateProperty.all(Colors.transparent),
        thumbColor: MaterialStateProperty.all(const Color(0xffCFCFCF)),
      )),
      child: Scrollbar(
        radius: const Radius.circular(10),
        trackVisibility: true,
        thickness: 7.0,
        thumbVisibility: true,
        child: GetBuilder<BrandController>(
          builder: (controller) {
            return controller.checkBrandListEmpty()
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 10.w),
                    itemCount:
                        controller.getBrandListLengthForBrandDetailList(),
                    itemBuilder: (BuildContext context, int index) {
                      final BrandModel countryInsideList =
                          controller.getBrandDetail(
                        index,
                      );
                      return InkWell(
                        onTap: () {
                          debugPrint(
                              "this Is id ${countryInsideList.attributeId}");
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
                            // "${countryInsideList.name}",
                            capitalize(countryInsideList.name),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyle.textStyleUtils400(
                              size: 16,
                              color: appColor,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LanguageConstants.noBrandFound.tr),
                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed<dynamic>(
                            RoutesConstants.dashboardScreen,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          backgroundColor: appColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: CommonTextOpenSans(
                          LanguageConstants.continueShopping.tr,
                          style: AppTextStyle.textStyleUtils600(
                            color: Colors.white,
                            size: 13.5,
                          ),
                        ),
                      )
                    ],
                  ));
          },
        ),
      ),
    );
  }

  String capitalize(String name) {
    return "${name[0].toUpperCase()}${name.substring(1)}";
  }
}
