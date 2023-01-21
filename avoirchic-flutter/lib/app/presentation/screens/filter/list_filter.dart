import 'package:avoirchic/app/presentation/screens/filter/widgets/category_widget.dart';
import 'package:avoirchic/app/presentation/screens/filter/widgets/sub_category_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../controller/filter_controller.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import '../../../theme/app_asset.dart';

class ListFilterPage extends GetView<FilterController> {
  const ListFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AppAsset.storeBackgroundImage,
                  ),
                ),
              ),
            ),
            Scaffold(
              key: controller.scaffoldKey.value,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 80,
                title: Text(
                  LanguageConstants.appnameText.tr,
                  style: AppTextStyle.textStyleUtils700(
                    color: const Color(0xff367587),
                    size: 22,
                  ),
                ),
              ),
              body: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff367587),
                        // size: 50.0,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff2F6D7E),
                              ),
                            ),
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 300,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                LanguageConstants
                                                    .filtersText.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils500(
                                                        color: const Color(
                                                            0xff367587),
                                                        size: 20),
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.close,
                                            size: 25.0,
                                            color: Color(0xff367587),
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
                                            children: const [
                                              CategoryWidget(),
                                              SubCategoryWidget(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 5.2),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff367587),
                                border: Border.all(
                                    width: 1, color: const Color(0xff367587))),
                            width: Get.width * .6,
                            child: MaterialButton(
                              onPressed: () {
                                controller.getFilteredProducts();
                              },
                              child: Center(
                                child: Text(
                                  LanguageConstants.applyFilterText.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
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
