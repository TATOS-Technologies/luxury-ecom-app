import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_opensans.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import '../../../controller/brand_list/brand_controller.dart';
import '../../../theme/app_asset.dart';
import '../../../theme/colors.dart';
import '../../common_widget/common_message/app_routes.dart';
import '../../common_widget/common_widget/common_button.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();

    String firstCapitalize(String name) {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    }

    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey2,
        backgroundColor: whiteColor,
        
        appBar: AppBar(
          elevation: 0,
          title: SvgPicture.asset(
            AppAsset.appLogo,
            width: 80,
            alignment: Alignment.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: Text(
                "${controller.brandDetails}",
                style: AppTextStyle.textStyleUtils400(size: 30),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                ),
                child: SizedBox(
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
                          controller.isSearchEnableForDetail.value = false;
                          controller.update();
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
                      prefixIcon: SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: SvgPicture.asset(
                          AppAsset.searchSvg,
                            fit: BoxFit.scaleDown,
                          )),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                        bottom: 12,
                        top: 12,
                        left: 12,
                      ),
                      hintText: LanguageConstants.findBrands.tr,
                      hintStyle: AppTextStyle.textStyleUtils500(
                          color: Colors.grey.shade600),
                      errorStyle: AppTextStyle.textStyleUtils400(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
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
                          borderRadius: BorderRadius.circular(10.0)),
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
                     
                    ),
                  ),
                  child: GetBuilder<BrandController>(
                    builder: (c) {
                      return Scrollbar(
                        radius: const Radius.circular(10),
                        thickness: 4.w,
                        child: controller.checkBrandListEmpty()
                            ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.only(left: 20.w),
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
                                        style: AppTextStyle.textStyleUtils500_14(),
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
                                  CommonButton(
                                    buttonType: ButtonType.OutlinedButton,
                                    onPressed: () {
                                      Get.offAllNamed(
                                        RoutesConstants.dashboardScreen,
                                      );
                                    },
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                      vertical: 5.0,
                                    ),
                                    color: Colors.black,
                                    child: CommonTextOpenSans(
                                      LanguageConstants.continueShopping.tr,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  )
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
