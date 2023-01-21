import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';

import '../../../controller/brand_controller.dart';
import '../../../core/utils/app_routes.dart';
import '../../../theme/app_asset.dart';
import '../../../theme/colors.dart';
import '../../common_widgets/common_widget/common_appbar.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();

    String capitalize(String name) {
      return "${name[0].toUpperCase()}${name.substring(1)}";
    }

    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey2,
        backgroundColor: backGroundColor,
        appBar: commonAppbar(
          appBarColor: appBGColor,
        ),
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              // vertical: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Image.asset(
                        AppAsset.logo,
                        width: 110,
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8,
                        ),
                        child: Text("${controller.brandDetails}",
                            style: AppTextStyle.textStyleUtils400(
                                size: 30, color: appTextColor)),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    autofocus: false,
                    textAlign: TextAlign.left,
                    cursorColor: blackColor,
                    cursorHeight: 20,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        Future.delayed(
                          const Duration(
                            milliseconds: 500,
                          ),
                        ).then((value) {
                          controller.isSearchEnable.value = false;
                        });
                      } else {
                        controller.setSerchwithAlphabaticForDetail(
                          value.toUpperCase(),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Find Brands',
                      contentPadding: const EdgeInsets.only(left: 50),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: greyC8C8C8,
                          width: 2.w,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: greyC8C8C8,
                          width: 2.w,
                        ),
                      ),
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
                          appTextColor,
                        ),
                        trackColor: MaterialStateProperty.all(
                          Colors.red[500],
                        ),
                        trackBorderColor: MaterialStateProperty.all(
                          Colors.yellow[500],
                        ),
                      ),
                    ),
                    child: GetBuilder<BrandController>(builder: (c) {
                      return Scrollbar(
                        radius: const Radius.circular(10),
                        thickness: 7.0,
                        child: controller.checkBrandListEmpty()
                            ? ListView.builder(
                                padding: EdgeInsets.only(left: 10.w),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                    .getBrandListLengthForBrandDetailList(),
                                itemBuilder: (BuildContext context, int index) {
                                  final BrandModel countryInsideList =
                                      controller.getBrandDetail(
                                    index,
                                  );
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                        "this Is id ${countryInsideList.attributeId}",
                                      );
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
                                          capitalize(
                                            countryInsideList.name,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style:
                                              AppTextStyle.textStyleUtils400_16(
                                                  color: appTextColor)),
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
                                      backgroundColor: Get.theme.primaryColor,
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
                    }),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
