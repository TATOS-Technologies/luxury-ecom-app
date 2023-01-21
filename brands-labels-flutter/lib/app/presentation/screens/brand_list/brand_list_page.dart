import 'package:brandslabels/app/controller/brand_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/brand_list/brand_model.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import 'brand_list_detail_screen.dart';

class BrandListPage extends GetView<BrandController> {
  BrandListPage({Key? key}) : super(key: key);

  String firstCapitalize(String name) {
    return name.split(" ").map((str) => str.capitalize).join(" ");
  }

  Widget expandDetailWidget(BuildContext context, String text, int value) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 8,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: regularF5F5F5,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40.w,
                        width: 40.w,
                        child: Center(
                          child: Text(
                            text,
                            style:AppTextStyle.textStyleUtils600(size: 20.sp),
                          ),
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  vertical: 5,
                                ),
                                decoration:
                                    const BoxDecoration(border: Border()),
                                child: Text(
                                  firstCapitalize(countryInsideList.name),
                                  // "${countryInsideList.name}",
                                  overflow: TextOverflow.ellipsis,
                                  style:AppTextStyle.textStyleUtils400(),
                                ),
                              ),
                            );
                          },
                        ),
                        if (controller.listDisplay(text).length >
                            10)
                          InkWell(
                            onTap: () {
                              debugPrint(
                                  "${controller.listDisplay(text).length}");
                              controller.brandDetails.value = text;
                              controller.isSearchEnableForDetail.value = false;
                              controller.update();
                              Get.to(
                                const BrandDetailsPage(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Text(
                                LanguageConstants.more.tr,
                                style:AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final Map<String, List<BrandDetail>> groupedLists = {};

  @override
  Widget build(BuildContext context) {
    // groupMyList();
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                ),
                child: Image.asset(
                  AppAsset.brandListLogo,
                  width: 80,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.person_outline,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.bgbp.tr,
                    style:AppTextStyle.textStyleUtils400_16(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                      bottom: 2.0,
                    ),
                    child: Text(
                      "|",
                      style:AppTextStyle.textStyleUtils400(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text(
                    LanguageConstants.engText.tr,
                    style:AppTextStyle.textStyleUtils400_16(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2.0,
                      bottom: 2.0,
                    ),
                    child: Text(
                      "|",
                      style:AppTextStyle.textStyleUtils400(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.flag,
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            
            children: [
              SizedBox(height: 20.h,),
              SizedBox(
                width: 327.w,
                child: TextFormField(
                    controller: controller.searchController,
                    autofocus: false,
                    textAlign: TextAlign.left,
                    cursorColor: blackColor,
                    cursorHeight: 20,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.resetMethod();
                      } else {
                        controller.setSerchwithAlphabatic(
                          value.toUpperCase(),
                        );
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
                    )),
              ),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                        color: Color(0xff000080),
                        // size: 50.0,
                      ))
                    : (controller.isSearchEnable.value == true
                            ? controller.filtersearchAlllist.isNotEmpty
                            : controller.filterAlllist.isNotEmpty)
                        ? Scrollbar(
                            thumbVisibility: true,
                            interactive: true,
                            // trackVisibility: true,

                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 20.h),
                              itemCount:
                                  controller.filtersearchAlllist.isNotEmpty
                                      ? controller.filtersearchAlllist.length
                                      : controller.filterAlllist.length,
                              itemBuilder: (BuildContext context, int index) {
                                final String brandsListCapital =
                                    controller.filtersearchAlllist.isNotEmpty
                                        ? controller.filtersearchAlllist[index]
                                        : controller.filterAlllist[index]
                                            .toString();
                                return Container(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade100,
                                          width: 1.5.w)),
                                  margin: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: ListTileTheme(
                                    contentPadding: EdgeInsets.zero,
                                    minVerticalPadding: 10,
                                    dense: true,
                                    horizontalTitleGap: 1.2,
                                    minLeadingWidth: 10,
                                    child: expandDetailWidget(
                                      context,
                                      brandsListCapital,
                                      index + 1,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Center(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
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
                                        text: '${LanguageConstants
                                            .itSeemsWeHaveNothingToShowFor.tr} ',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                controller.searchController.text,
                                            style:AppTextStyle.textStyleUtils700(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12
                                    ),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: '${LanguageConstants
                                            .ifYouWouldLikeToHaveMoreInformationAbout
                                            .tr} ',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                controller.searchController.text,
                                            style:AppTextStyle.textStyleUtils700(),
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
                                      LanguageConstants
                                          .thenPleaseCreateATicket.tr,
                                      style:AppTextStyle.textStyleUtils500(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: CommonThemeButton(
                                            onTap: () {
                                              // Get.find<SpecialRequestController>().brandName = Get.arguments[2];
                                              // Get.offAllNamed(RoutesConstants.dashboardScreen);
                                              Get.toNamed(
                                                RoutesConstants.specialRequestScreen,
                                                arguments: [
                                                  controller.searchController.text,
                                                  "brand",
                                                ],
                                              );
                                            },
                                            title:
                                              LanguageConstants.createTicket.tr,
                                          )
                                        ),
                                         SizedBox(
                                          height: 20.h,
                                        ),
                                        SizedBox(
                                          child: CommonThemeButton(
                                            onTap: () {
                                              controller.continueShoppingTap();
                                            },
                                            title: LanguageConstants.continueShopping.tr,
                                            
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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

class BrandDetail {
  String? name;
  String? id;

  BrandDetail({required this.name, required this.id});
}
