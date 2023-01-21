import 'package:avoirchic/app/controller/store_credit_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(LanguageConstants.storeCreditText.tr),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                    // commonAppbar(
                    //   appBarColor: Colors.transparent,
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Text(LanguageConstants.storeCreditText.tr,
                    //     style: AppTextStyle.textStyleUtils500_16()),
                    Expanded(
                      child: controller.shoopingbiling.value
                          ? const Center(
                              child: SpinKitThreeBounce(
                                color: Color(0xff2F6D7E),
                              ),
                            )
                          : controller.nodata.value
                              ? Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const NothigToShowAnimationWidget(),
                                      Text(
                                        "You Have No Store Credit",
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 15),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          backgroundColor: appTextColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount:
                                        controller.getStoreCreditList!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final storeData =
                                          controller.getStoreCreditList![index];
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: borderGrey,
                                              width: 2,
                                            )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 15.w),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(11),
                                                    topRight:
                                                        Radius.circular(11),
                                                  ),
                                                  color: blueTileColor),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "Date : ${storeData.atTime}",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Expanded(
                                                        child: Text(
                                                          "Description :",
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                            "${storeData.summary}",
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: borderGrey,
                                              height: 2,
                                              thickness: 2,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 14.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Amount",
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "${storeData.amount}"),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Balance",
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "${storeData.balance}",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Remarks",
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "${storeData.used}",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
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
          ],
        ),
      ),
    );
  }
}
