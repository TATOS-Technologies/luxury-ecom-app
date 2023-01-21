import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import '../../../core/utils/app_routes.dart';
import '../../../controller/brand_controller.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import '../../common_widgets/common_widget/common_appbar.dart';
import '../../common_widgets/common_widget/common_text_opensans.dart';
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
      () => Scaffold(
        key: controller.scaffoldKey2,
        backgroundColor: whiteColor,
        appBar: commonAppbar(),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      AppAsset.logo,
                      width: 80,
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
                      child: Text(
                        "${controller.brandDetails}",
                        style: AppTextStyle.textStyleUtils400(
                          size: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
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
                          controller.isSearchEnable.value = false;
                          // controller.getBrandList();
                        });
                      } else {
                        controller.setSerchwithAlphabaticForDetail(
                            value.toUpperCase());
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: SizedBox(
                          height: 20.w,
                          width: 20.w,
                          child: SvgPicture.asset(
                            AppAsset.search,
                            fit: BoxFit.scaleDown,
                          )),
                      hintText: LanguageConstants.findBrand.tr,
                      contentPadding: const EdgeInsets.only(left: 20),
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
                                shrinkWrap: true,
                                itemCount: controller
                                    .getBrandListLengthForBrandDetailList(),
                                itemBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  final BrandModel countryInsideList =
                                      controller.getBrandDetail(index);
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(
                                          "this Is id ${countryInsideList.attributeId}");
                                      Get.toNamed(
                                        RoutesConstants.productListScreen,
                                        arguments: [
                                          "brand",
                                          countryInsideList.attributeId,
                                          countryInsideList.name
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
                                        firstCapitalize(countryInsideList.name),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:AppTextStyle.textStyleUtils400_16(),
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
                                      // dashboardController.scaffoldkey = GlobalKey();
                                      // dashboardController.update();
                                      // Get.to(() => DashboardScreen());
                                      Get.offAllNamed(
                                          RoutesConstants.dashboardScreen);

                                      // Get.toNamed(RoutesConstants.dashboardScreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      backgroundColor: appBarPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
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
