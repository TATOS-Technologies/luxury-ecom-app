import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/brand_list/widget/brand_scroll_list.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({Key? key}) : super(key: key);

  String capitalize(String name) {
    return "${name[0].toUpperCase()}${name.substring(1)}";
  }

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey2.value,
        backgroundColor: backGroundColor,
        appBar: commonAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: Image.asset(
                      AppAsset.logo,
                      width: 110,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.w,
                        color: appColor,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: Text(
                        "${controller.brandDetails}",
                        style: AppTextStyle.textStyleUtils700(
                            size: 20.sp, color: appColor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                height: 50.w,
                width: 327.w,
                child: TextFormField(
                  controller: controller.searchController,
                  cursorColor: appColor,
                  decoration: InputDecoration(
                    prefixIcon: SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: SvgPicture.asset(
                          AppAsset.svgSearch,
                          fit: BoxFit.scaleDown,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                      bottom: 12,
                      top: 12,
                      left: 12,
                    ),
                    hintText: LanguageConstants.findBrandsText.tr,
                    hintStyle: AppTextStyle.textStyleUtils500(
                        color: appColor.withOpacity(0.4)),
                    errorStyle: AppTextStyle.textStyleError(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: const BorderSide(
                        color: appBorderColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      borderSide: const BorderSide(
                        color: appBorderColor,
                        width: 1.0,
                      ),
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: appBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      Future<Duration>.delayed(
                              const Duration(milliseconds: 500))
                          .then((value) {
                        controller.isSearchEnable.value = false;
                        // controller.getBrandList();
                      });
                    } else {
                      controller.setSerchwithAlphabaticForDetail(
                        value.toUpperCase(),
                        controller.brandDetails.value.toString(),
                      );
                    }
                  },
                ),
              ),
              const Expanded(
                child: BrandScrollList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder getOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        20.0,
      ),
      borderSide: const BorderSide(
        color: appColor,
        width: 1.0,
      ),
    );
  }

  Widget brandScrollList() {
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
}
