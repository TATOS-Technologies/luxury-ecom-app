import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:suvandnat/app/controller/search/search_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/search/widget/search_product_list_widget.dart';
import 'package:suvandnat/app/presentation/screens/search/widget/search_textfield.dart';
import 'package:suvandnat/app/presentation/screens/search/widget/tabbar_vategory_name_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../common_widget/no_data_text.dart';
import '../faq/widgets/expansion_til.dart';

class SearchScreen extends GetView<SearchController> {
  SearchScreen({Key? key}) : super(key: key);

  @override
  final SearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: controller.scrollNotificationData,
              child: controller.menuModel?.value.childrenData == null
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColorPrimary,
                        // size: 50.0,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const SearchTextField(),
                        const SizedBox(height: 10),
                        controller.searchValue.value.isNotEmpty
                            ? controller.isSearchDataLoad.value
                                ? const Expanded(
                                    child: Center(
                                      child: SpinKitThreeBounce(
                                        color: Color(0xFF973133),
                                        // size: 50.0,
                                      ),
                                    ),
                                  )
                                : controller.productsList.isNotEmpty
                                    ? const SearchProductListWidget()
                                    : Expanded(
                                        child: NoData(
                                          textForQuery: controller.txtList.text,
                                          onTap: () {
                                            controller.searchValue.value = '';
                                            controller.txtList.clear();
                                          },
                                        ),
                                      )
                            : Expanded(
                                child: DefaultTabController(
                                  length: controller.menuModel?.value
                                          .childrenData?.length ??
                                      0,
                                  initialIndex: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        const TabBarCategoryNameWidget(),
                                        Expanded(
                                          child: TabBarView(
                                            children: List<Widget>.generate(
                                              controller.menuModel?.value
                                                      .childrenData?.length ??
                                                  0,
                                              (int index1) {
                                                return ((controller
                                                                .menuModel
                                                                ?.value
                                                                .childrenData?[
                                                                    index1]
                                                                .childrenData
                                                                ?.length ??
                                                            0) >
                                                        0)
                                                    ? ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount: controller
                                                                .menuModel
                                                                ?.value
                                                                .childrenData?[
                                                                    index1]
                                                                .childrenData
                                                                ?.length ??
                                                            0,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          ChildrenData? data2 =
                                                              controller
                                                                  .menuModel
                                                                  ?.value
                                                                  .childrenData?[
                                                                      index1]
                                                                  .childrenData?[index];
                                                          return ExpansionTil(
                                                            isIcon: true,
                                                            trailing:
                                                                const Icon(
                                                              Icons.add,
                                                              size: 15,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            tileHeight: 30,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            verticalVisualDensity:
                                                                -1,
                                                            title: Text(
                                                              data2?.name ?? '',
                                                              style: AppTextStyle
                                                                  .textStyleUtils400(),
                                                            ),
                                                            children: [
                                                              ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                itemCount: data2
                                                                        ?.childrenData
                                                                        ?.length ??
                                                                    0,
                                                                itemBuilder:
                                                                    (context,
                                                                        index2) {
                                                                  ChildrenData?
                                                                      itemLevel3 =
                                                                      data2?.childrenData![
                                                                          index2];
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      Get.toNamed(
                                                                          RoutesConstants
                                                                              .productListScreen,
                                                                          arguments: [
                                                                            "dash",
                                                                            data2?.childrenData?[index2].id,
                                                                            // controller.menuModel?.value.childrenData?[index].name ??
                                                                            //     ''
                                                                            data2?.childrenData?[index2].name
                                                                          ]);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      margin: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              40.0,
                                                                          top:
                                                                              3.0,
                                                                          bottom:
                                                                              3.0),
                                                                      child:
                                                                          Text(
                                                                        itemLevel3?.name ??
                                                                            '',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: AppTextStyle.textStyleUtils400_12(
                                                                            color:
                                                                                grey636363),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      )
                                                    : SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const NothigToShowAnimationWidget(),
                                                            CommonTextPoppins(
                                                              LanguageConstants
                                                                  .noProductsFound
                                                                  .tr,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            SizedBox(
                                                              height: 35.h,
                                                              child:
                                                                  CommonThemeButton(
                                                                      onTap:
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
                                                                      title: LanguageConstants
                                                                          .createTicket
                                                                          .tr),
                                                            ),
                                                            SizedBox(
                                                              height: 50.h,
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 20),
                      ],
                    ),
            ),
            Obx(
              () => !controller.visibleLoader.value
                  ? const SizedBox.shrink()
                  : const ScreenLoading(),
            )
          ],
        ),
      ),
    );
  }
}
