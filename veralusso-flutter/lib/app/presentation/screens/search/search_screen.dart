import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:veralusso/app/controller/search/search_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/no_data_text.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/presentation/screens/search/widget/product.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class SearchScreen extends GetView<SearchController> {
  @override
  final SearchController controller = Get.find();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: whiteColor,
      body: Obx(
        () => NotificationListener<ScrollNotification>(
          onNotification: controller.scrollNotificationData,
          child: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: blackColor,
                  ),
                )
              : Stack(
                  children: [
                    controller.menuModel?.value.childrenData != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                filterDropDown(),
                                const SizedBox(height: 10),
                                controller.searchValue.value.isNotEmpty
                                    ? controller.isSearchDataLoad.value
                                        ? const Expanded(
                                            child: Center(
                                              child: SpinKitThreeBounce(
                                                color: blackColor,
                                              ),
                                            ),
                                          )
                                        : controller.productsList.isNotEmpty
                                            ? searchProductListWidget()
                                            : Expanded(
                                                child: NoData(
                                                  textForQuery:
                                                      controller.txtList.text,
                                                  onTap: () {
                                                    controller
                                                        .searchValue.value = '';
                                                    controller.txtList.clear();
                                                  },
                                                ),
                                              )
                                    : Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: SingleChildScrollView(
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  dividerColor:
                                                      Colors.transparent),
                                              child: Column(
                                                children: List<Widget>.generate(
                                                    controller
                                                            .menuModel
                                                            ?.value
                                                            .childrenData
                                                            ?.length ??
                                                        0, (int index1) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20.w),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(10.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffF4F4F4))),
                                                      child: ExpansionTile(
                                                        iconColor: Colors.black,
                                                        collapsedIconColor:
                                                            Colors.black,
                                                        title: Text(
                                                            controller
                                                                    .menuModel
                                                                    ?.value
                                                                    .childrenData?[
                                                                        index1]
                                                                    .name ??
                                                                '',
                                                            style: AppTextStyle
                                                                .textStyleUtils600_16()),
                                                        children: [
                                                          (controller
                                                                          .menuModel
                                                                          ?.value
                                                                          .childrenData?[
                                                                              index1]
                                                                          .childrenData
                                                                          ?.length ??
                                                                      0) >
                                                                  0
                                                              ? Column(
                                                                  children: List.generate(
                                                                      controller
                                                                              .menuModel
                                                                              ?.value
                                                                              .childrenData?[
                                                                                  index1]
                                                                              .childrenData
                                                                              ?.length ??
                                                                          0,
                                                                      (index) {
                                                                    ChildrenData? data2 = controller
                                                                        .menuModel
                                                                        ?.value
                                                                        .childrenData?[
                                                                            index1]
                                                                        .childrenData?[index];
                                                                    return ExpansionTile(
                                                                      iconColor:
                                                                          Colors
                                                                              .black,
                                                                      title:
                                                                          Text(
                                                                        data2?.name ??
                                                                            '',
                                                                        style: AppTextStyle
                                                                            .textStyleUtils400(),
                                                                      ),
                                                                      children: [
                                                                        ListView.builder(
                                                                            shrinkWrap: true,
                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                            padding: EdgeInsets.zero,
                                                                            itemCount: data2?.childrenData?.length ?? 0,
                                                                            itemBuilder: (context, index2) {
                                                                              ChildrenData? itemLevel3 = data2?.childrenData![index2];
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  Get.toNamed(RoutesConstants.productListScreen, arguments: [
                                                                                    "dash",
                                                                                    // data2?.childrenData?[index2]
                                                                                    //     .id,
                                                                                    // controller
                                                                                    //         .menuModel
                                                                                    //         ?.value
                                                                                    //         .childrenData?[index2]
                                                                                    //         .name ??
                                                                                    //     ''
                                                                                    itemLevel3?.id,
                                                                                    itemLevel3?.name ?? ''
                                                                                  ]);
                                                                                },
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(left: 30.w, bottom: 20.w),
                                                                                  child: Text(
                                                                                    itemLevel3?.name ?? '',
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: AppTextStyle.textStyleUtils400(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            })
                                                                      ],
                                                                    );
                                                                  }),
                                                                )
                                                              : Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      LanguageConstants
                                                                          .noProductsFound
                                                                          .tr,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: AppTextStyle
                                                                          .normalRegular14,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20.w,
                                                                    ),
                                                                    ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.toNamed(
                                                                          RoutesConstants
                                                                              .specialRequestScreen,
                                                                          arguments: [
                                                                            controller.txtList.text,
                                                                            "category"
                                                                          ],
                                                                        );
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            blackColor,
                                                                        elevation:
                                                                            0,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            side: const BorderSide(color: blackColor, width: 2)),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        LanguageConstants
                                                                            .createTicket
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                        style: AppTextStyle.textStyleUtils400(
                                                                            color:
                                                                                whiteColor),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                // const SizedBox(height: 20),
                              ],
                            ),
                          )
                        : const Center(
                            child: SpinKitThreeBounce(
                              color: blackColor,
                              // size: 50.0,
                            ),
                          ),
                    controller.visibleLoader.value
                        ? const ScreenLoading()
                        : const SizedBox.shrink()
                  ],
                ),
        ),
      ),
    );
  }

  Widget filterDropDown() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: SizedBox(
        width: 327.w,
        child: TextFormField(
          controller: controller.txtList,
          autofocus: false,
          textAlign: TextAlign.left,
          cursorColor: blackColor,
          cursorHeight: 20,
          keyboardType: TextInputType.text,
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
            hintStyle:
                AppTextStyle.textStyleUtils500(color: Colors.grey.shade600),
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
            hintText: LanguageConstants.searchText.tr,
          ),
          onChanged: (val) {
            controller.getSearchData(argument: val);
          },
        ),
      ),
    );
  }

  Widget searchProductListWidget() {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: Container(
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8,
            ),
            child: Text(
              '${controller.productCount.value.toString()}/${(controller.searchItemList.value.totalCount ?? 0).toString()}',
              style:
                  AppTextStyle.textStyleUtils400(color: Colors.white, size: 10),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                addAutomaticKeepAlives: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 12.5,
                  childAspectRatio: .76,
                ),
                itemCount: controller.productsList.length,
                itemBuilder: (_, index) {
                  ProductItem item = controller.productsList[index];
                  return Product(
                    item: item,
                    index: index,
                  );
                },
              ),
            ),
            controller.productLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: blackColor,
                      size: 20.0,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
