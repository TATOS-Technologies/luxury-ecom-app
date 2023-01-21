import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/filter/filter_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/screens/filter/widgets/filter_category_widget.dart';
import 'package:suvandnat/app/presentation/screens/filter/widgets/filter_list_widget.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class ListFilterPage extends GetView<FilterController> {
  ListFilterPage({Key? key}) : super(key: key);

  @override
  final FilterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: const Color(0xffD1F1FF),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          title: Text(LanguageConstants.appNameText.tr,
              style: AppTextStyle.textStyleUtils700(size: 26)),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: Color(0xFF973133),
                // size: 50.0,
              ))
            : SingleChildScrollView(
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xff82D9FF))),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 300,
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          LanguageConstants.filtersText.tr,
                                          style: AppTextStyle.textStyleUtils500(
                                              color: const Color(0xff973033),
                                              size: 20),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.close,
                                      size: 25.0,
                                      color: Color(0xff973033),
                                    )
                                  ],
                                ),
                                // Divider(),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const FilterCategoryWidget(),
                                        Expanded(
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 5.0,
                                                  right: 10.0,
                                                  top: 10.0,
                                                  bottom: 10.0),
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: const Color(
                                                          0xff82D9FF))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: const Color(
                                                                  0xffCBCBCB))),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Image.asset(
                                                            AppAsset.search1,
                                                            color: const Color(
                                                                0xffCBCBCB),
                                                            height: 18.0,
                                                            width: 18.0,
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 35.0,
                                                              child:
                                                                  TextFormField(
                                                                cursorColor:
                                                                    Colors.grey,
                                                                decoration: InputDecoration(
                                                                    hintText:
                                                                        LanguageConstants
                                                                            .searchText
                                                                            .tr,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    hintStyle: AppTextStyle.textStyleUtils400(
                                                                        color: const Color(
                                                                            0xff8D8D8D),
                                                                        size:
                                                                            13),
                                                                    border:
                                                                        InputBorder
                                                                            .none
                                                                    //fillColor: Colors.green
                                                                    ),
                                                                style: AppTextStyle
                                                                    .textStyleUtils400(
                                                                        size:
                                                                            13),
                                                                onChanged:
                                                                    (value) {
                                                                  controller
                                                                      .searchFilter(
                                                                          value);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  const FilterListWidget(),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height / 5.2),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff973033),
                          border: Border.all(
                              width: 1, color: const Color(0xff973033))),
                      width: Get.width * .6,
                      child: MaterialButton(
                        onPressed: () {
                          controller.getApplyFilteredProducts();
                        },
                        child: Center(
                            child: Text(
                          LanguageConstants.applyFilterText.tr,
                          style: AppTextStyle.textStyleUtils400(
                              color: Colors.white, size: 18),
                        )),
                      )),
                ]),
              )));
  }
}
