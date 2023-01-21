import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/brand_list/brand_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/screens/brand_list/brand_expand_detail_widget.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../theme/app_asset.dart';

class BrandListPage extends GetView<BrandController> {
  BrandListPage({Key? key}) : super(key: key);
  @override
  final BrandController controller = Get.find();

  final list = [
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'John'),
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'John'),
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'John'),
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'John'),
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'John'),
    BrandDetail(name: 'Mark'),
    BrandDetail(name: 'Jessica'),
    BrandDetail(name: 'Alexander'),
    BrandDetail(name: 'Zahira'),
    BrandDetail(name: 'Alexander'),
  ];

  final Map<String, List<BrandDetail>> groupedLists = {};

  void groupMyList() {
    for (var brand in list) {
      if (groupedLists[brand.name![0]] == null) {
        groupedLists[brand.name![0]];
      }
      groupedLists[brand.name![0]]?.add(
        brand,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    groupMyList();
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.grey.shade100,
        appBar: null,
        body: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              // height: 50.w,
              width: 327.w,
              child: TextFormField(
                controller: controller.searchController,
                autofocus: false,
                textAlign: TextAlign.left,
                cursorColor: blackColor,
                cursorHeight: 20,
                keyboardType: TextInputType.text,
                onChanged: (val) {
                  if (val.isEmpty) {
                    controller.resetMehod();
                  } else {
                    controller.setSerchwithAlphabatic(
                      val.toUpperCase(),
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
            Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                      color: Colors.black,

                      // size: 50.0,
                    ))
                  : (controller.isSearchEnable.value == true
                          ? controller.filtersearchAlllist.isNotEmpty
                          : controller.filterAlllist.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w
                              // top: 10,
                              ),
                          child: Theme(
                            data: ThemeData(
                              scrollbarTheme:
                                  const ScrollbarThemeData().copyWith(
                                thumbColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                              ),
                            ),
                            child: Scrollbar(
                              radius: const Radius.circular(5),
                              thickness: 4.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                itemCount:
                                    controller.filtersearchAlllist.isNotEmpty
                                        ? controller.filtersearchAlllist.length
                                        : controller.filterAlllist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String brandsListCapital = controller
                                          .filtersearchAlllist.isNotEmpty
                                      ? controller.filtersearchAlllist[index]
                                      : controller.filterAlllist[index];
                                  return Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTileTheme(
                                      contentPadding: EdgeInsets.zero,
                                      minVerticalPadding: 10,
                                      dense: true,
                                      horizontalTitleGap: 1.2,
                                      minLeadingWidth: 10,
                                      child: ExpandDetailWidget(
                                        brandsListCapital,
                                        index + 1,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const NothigToShowAnimationWidget(),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  textScaleFactor: 1,
                                  text: TextSpan(
                                    text: LanguageConstants
                                        .itSeemsWeHaveNothingToShowFor.tr,
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: controller.searchController.text,
                                        style: AppTextStyle.textStyleUtils700(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                ),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  textScaleFactor: 1,
                                  text: TextSpan(
                                    text: LanguageConstants
                                        .ifYouWouldLikeToHaveMoreInformationAbout
                                        .tr,
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: controller.searchController.text,
                                        style: AppTextStyle.textStyleUtils700(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Text(
                                  LanguageConstants.thenPleaseCreateTicket.tr,
                                  style: AppTextStyle.textStyleUtils500(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          RoutesConstants.specialRequestScreen,
                                          arguments: [
                                            controller.searchController.text,
                                            "brand",
                                          ],
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: whiteColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: blackColor, width: 2)),
                                      ),
                                      child: Text(
                                        LanguageConstants.createTicket.tr,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.textStyleUtils400(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.offAllNamed(
                                            RoutesConstants.dashboardScreen);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: blackColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: blackColor, width: 2)),
                                      ),
                                      child: Text(
                                        LanguageConstants.continueShopping.tr,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyle.textStyleUtils400(
                                            color: whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandDetail {
  String? name;
  String? id;

  BrandDetail({this.name, this.id});
}
