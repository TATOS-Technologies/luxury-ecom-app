import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/filter/filter_controller.dart';
import 'package:veralusso/app/presentation/screens/filter/widgets/filter_option_list.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class ListFilterPage extends GetView<FilterController> {
  @override
  final FilterController controller = Get.find();

  ListFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          title: Text(
            LanguageConstants.filtersText.tr,
            style: AppTextStyle.textStyleUtils700(size: 22),
          ),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : controller.isNullable.value
                ? Center(
                    child: Text(
                      controller.erroMessage.value.toString(),
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(children: [
                      Container(
                          // decoration: BoxDecoration(
                          //     border:
                          //         Border.all(width: 1, color: regularF2F2F2)),
                          margin: const EdgeInsets.all(
                            10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                  10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => const FilterOptionList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 30.w,
                        width: 150.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9))),
                            onPressed: () {
                              controller.getFilteredProducts();
                            },
                            child: Text(
                              LanguageConstants.applyFilterText.tr,
                              style: AppTextStyle.textStyleUtils400_18(
                                  color: Colors.white),
                            )),
                      ),
                    ]),
                  )));
  }
}
