import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_opensans.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import '../../../controller/brand_list/brand_controller.dart';
import '../../app_routes.dart';
import '../../../theme/app_asset.dart';
import '../../../theme/colors.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();

    String firstCapitalize(String name) {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    }

    return Obx(
      () => CommonBacground(
        child: Scaffold(
          key: controller.scaffoldKey2,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: SvgPicture.asset(
              AppAsset.appLogo,
              width: 110,
              alignment: Alignment.center,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  top: 10,
                ),
                child: Text(
                  "${controller.brandDetails}",
                  style: AppTextStyle.textStyleUtils400(size: 30),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                width: 327.w,
                child: TextFormField(
                  autofocus: false,
                  textAlign: TextAlign.left,
                  cursorColor: blackColor,
                  cursorHeight: 20,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      Future.delayed(const Duration(milliseconds: 500))
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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: LanguageConstants.findBrands.tr,
                    contentPadding: const EdgeInsets.only(
                      left: 50,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Theme(
                  data: ThemeData(
                    scrollbarTheme: const ScrollbarThemeData().copyWith(
                      thumbColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                      trackColor: MaterialStateProperty.all(
                        Colors.red[500],
                      ),
                      trackBorderColor: MaterialStateProperty.all(
                        Colors.yellow[500],
                      ),
                    ),
                  ),
                  child: GetBuilder<BrandController>(
                    builder: (c) {
                      return Scrollbar(
                        radius: const Radius.circular(10),
                        thickness: 7.0,
                        child: controller.checkBrandListEmpty()
                            ? ListView.builder(
                                padding: EdgeInsets.all(24.w),
                                shrinkWrap: true,
                                itemCount: controller
                                    .getBrandListLengthForBrandDetailList(),
                                itemBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  final BrandModel countryInsideList =
                                      controller.getBrandDetail(
                                    index,
                                  );
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                          "this Is id ${countryInsideList.attributeId}");
                                      Get.toNamed(
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
                                        firstCapitalize(
                                          countryInsideList.name,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:
                                            AppTextStyle.textStyleUtils400_16(),
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
                                      Get.offAllNamed(
                                        RoutesConstants.dashboardScreen,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      backgroundColor: appColorPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    child: CommonTextOpenSans(
                                      LanguageConstants.continueShopping.tr,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.5,
                                    ),
                                  ),
                                ],
                              )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
