import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/brand_list/widget/expand_detail.dart';

import 'widget/search_field_widget.dart';

class BrandListPage extends GetView<BrandController> {
  const BrandListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();
    // var expandvalue = false.obs;
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: homeBackground,
        appBar: AppBar(
          backgroundColor: homeBackground,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Image.asset(
            AppAsset.logo,
            width: 110,
            fit: BoxFit.fill,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            const SearchFieldWidget(),
            Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                      color: appColor,
                    ))
                  : (controller.isSearchEnable.value == true
                          ? controller.filtersearchAlllist.isNotEmpty
                          : controller.filterAlllist.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Theme(
                            data: ThemeData.light().copyWith(
                                scrollbarTheme:
                                    const ScrollbarThemeData().copyWith(
                              thickness: MaterialStateProperty.all(1),
                              trackBorderColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              thumbColor: MaterialStateProperty.all(
                                  const Color(0xffCFCFCF)),
                            )),
                            child: Scrollbar(
                              thumbVisibility: true,
                              trackVisibility: true,
                              interactive: true,
                              thickness: 5.w,
                              radius: const Radius.circular(5),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                itemCount:
                                    controller.filtersearchAlllist.isNotEmpty
                                        ? controller.filtersearchAlllist.length
                                        : controller.filterAlllist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final brandsListCapital = controller
                                          .filtersearchAlllist.isNotEmpty
                                      ? controller.filtersearchAlllist[index]
                                      : controller.filterAlllist[index];
                                  return ListTileTheme(
                                    contentPadding: EdgeInsets.zero,
                                    minVerticalPadding: 10,
                                    dense: true,
                                    horizontalTitleGap: 1.2,
                                    minLeadingWidth: 10,
                                    child: ExpandDetail(
                                      text: brandsListCapital
                                          .toString()
                                          .toUpperCase(),
                                      value: index + 1,
                                      controller: controller,
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
                                      const TextSpan(
                                        text: ' ',
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: controller.searchController.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                       const TextSpan(
                                        text: ' ',
                                        style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: controller.searchController.text,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    CommonThemeButton(
                                      onTap: () {
                                        // Get.find<SpecialRequestController>().brandName = Get.arguments[2];
                                        // Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                                        Get.toNamed<dynamic>(
                                          RoutesConstants.specialRequesScreen,
                                          arguments: [
                                            controller.searchController.text,
                                            "brand",
                                          ],
                                        );
                                      },
                                     title:
                                        LanguageConstants.createTicket.tr,
                                      
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    CommonThemeButton(
                                      onTap: () {
                                        controller.continueShoppingTap();
                                      },
                                      title: 
                                        LanguageConstants.continueShopping.tr,
                                        
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
