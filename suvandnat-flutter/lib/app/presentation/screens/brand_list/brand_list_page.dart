import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/brand_list/brand_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/widgets/brand_expand_detail_widget.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/widgets/empty_data_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class BrandListPage extends GetView<BrandController> {
  final BrandController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              width: 327.w,
              child: TextFormField(
                controller: null,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    size: 25,
                    color: Colors.grey.shade300,
                  ),
                  hintText: LanguageConstants.findBrandsText.tr,
                  labelStyle:
                      AppTextStyle.textStyleUtils400(color: Colors.black54),
                  errorStyle: AppTextStyle.textStyleUtils400(
                      color: const Color(0xFF973133)),
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
                      borderRadius: BorderRadius.circular(15)),
                ),
                onChanged: (value) {
                  controller.setSerchwithAlphabatic(value.toUpperCase());
                },
              ),
            ),
            Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
                        // size: 50.0,
                      ),
                    )
                  : (controller.isSearchEnable.value
                          ? controller.filtersearchAlllist.isNotEmpty
                          : controller.filterAlllist.isNotEmpty)
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.all(24.w),
                          shrinkWrap: true,
                          itemCount: controller.filtersearchAlllist.isNotEmpty
                              ? controller.filtersearchAlllist.length
                              : controller.filterAlllist.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String brandsListCapital = controller
                                    .filtersearchAlllist.isNotEmpty
                                ? controller.filtersearchAlllist[index]
                                : controller.filterAlllist[index].toString();
                            return Padding(
                              padding: EdgeInsets.only(bottom: 15.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.all(20.w),
                                child: ListTileTheme(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 10,
                                  dense: true,
                                  horizontalTitleGap: 1.2,
                                  minLeadingWidth: 10,
                                  child: BrandExpandDetailWidget(
                                    text: brandsListCapital,
                                    value: index + 1,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const EmptyDataWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyDataWidget(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
                  text: LanguageConstants.itSeemsWeHaveNothingToShowFor.tr,
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
                      .ifYouWouldLikeToHaveMoreInformationAbout.tr,
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
                LanguageConstants.thenPleaseCreateATicket.tr,
                style: AppTextStyle.textStyleUtils500(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: appColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(
                        RoutesConstants.specialRequestScreen,
                        arguments: [
                          controller.searchController.text,
                          "brand",
                        ],
                      );
                    },
                    child: HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.createTicket.tr,
                      titleColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: appColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.continueShoppingTap();
                    },
                    child: HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.continueShopping.tr,
                      titleColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BrandDetail {
  String? name;
  String? id;

  BrandDetail({
    required this.name,
    required this.id,
  });
}
