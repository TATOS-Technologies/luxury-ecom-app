import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/controller/my_address/my_address_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../common_widget/common_text_poppins.dart';

class MyAddressScreen extends GetView<MyAddressController> {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonBacground(
          child: Scaffold(
            drawerEnableOpenDragGesture: false,
            backgroundColor: Colors.transparent,
            appBar: commonAppbar(title: LanguageConstants.addressBookText.tr),
            drawer: const Drawer(),
            body: controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                    color: Color(0xFF973133),
                    // size: 50.0,
                  ))
                : ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller
                                  .getAdressList.value.addresses?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            final getaddress = controller
                                .getAdressList.value.addresses![index];
                            return Padding(
                              padding:  EdgeInsets.only(bottom: 20.h),
                              child: GestureDetector(
                                  onTap: () async {
                                    bool result = await Get.toNamed(
                                        RoutesConstants.addAddressScreen,
                                        arguments: [
                                          controller.getAdressList.value,
                                          getaddress,
                                          1
                                        ]) as bool;
                                    if (result) {
                                      controller.getAddressList();
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: whiteColor,
                                        border: Border.all(
                                            color: borderGrey, width: 2)),
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, right: 15.w),
                                              height: 40.h,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                  color: blueTileColor,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10))),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  children: [
                                                    CommonTextPoppins(
                                                      '${LanguageConstants.addressText.tr} ${index + 1}',
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: primary,
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        // controller
                                                        //     .deleteAddressOnTap(
                                                        //         address);
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: 25,
                                                          color: primary,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: CommonTextPoppins(
                                                "${getaddress.firstname}, ${getaddress.lastname}, ${getaddress.street!.first}, ${getaddress.city}, ${getaddress.postcode}",
                                                fontSize: 14.sp,
                                                color: primary,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller
                                                        .billingCheckButtonOnTap(
                                                            getaddress);
                                                  },
                                                  child: Container(
                                                    height: 20.w,
                                                    width: 20.w,
                                                    padding: EdgeInsets.all(2.w),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                        border: Border.all(
                                                            color: primary,
                                                            width: 2)),
                                                    child: controller
                                                            .getAdressList
                                                            .value
                                                            .addresses![index]
                                                            .isBilling!
                                                            .value
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                color: primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.sp)),
                                                          )
                                                        : Container(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                CommonTextPoppins(
                                                  LanguageConstants
                                                      .billingText.tr,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                ),
                                                SizedBox(width: 40.w),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 20.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller
                                                          .shippingCheckButtonOnTap(
                                                              getaddress);
                                                    },
                                                    child: Container(
                                                      height: 20.w,
                                                      width: 20.w,
                                                      padding:
                                                          EdgeInsets.all(2.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: primary,
                                                              width: 2)),
                                                      child: controller
                                                              .getAdressList
                                                              .value
                                                              .addresses![index]
                                                              .isShipping!
                                                              .value
                                                          ? Container(
                                                              decoration: BoxDecoration(
                                                                  color: primary,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.sp)),
                                                            )
                                                          : Container(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                CommonTextPoppins(
                                                  LanguageConstants
                                                      .defaultShipping.tr,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: primary,
                                                ),
                                                const SizedBox(width: 0),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30.h,
                                            )
                                          ],
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Expanded(
                                        //       flex: 3,
                                        //       child: Text(
                                        //         "${getaddress.firstname}, ${getaddress.lastname}, ${getaddress.street!.first}, ${getaddress.city}, ${getaddress.postcode}",
                                        //         style: AppTextStyle.textStyleUtils400(),
                                        //       ),
                                        //     ),
                                        //     Expanded(
                                        //         flex: 2,
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment.spaceAround,
                                        //           children: [
                                        //             Obx(
                                        //               () => InkWell(
                                        //                 onTap: () {
                                        //                   controller
                                        //                       .billingCheckButtonOnTap(
                                        //                           getaddress);
                                        //                 },
                                        //                 child: Container(
                                        //                   height: 15,
                                        //                   width: 15,
                                        //                   alignment:
                                        //                       Alignment.center,
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(
                                        //                           color:
                                        //                               Colors.black,
                                        //                           width: 1)),
                                        //                   child: getaddress
                                        //                           .isBilling!.value
                                        //                       ? const Icon(
                                        //                           Icons.check,
                                        //                           size: 12,
                                        //                           color:
                                        //                               Colors.black)
                                        //                       : Container(),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //             Padding(
                                        //               padding:
                                        //                   const EdgeInsets.only(
                                        //                       left: 20.0),
                                        //               child: Obx(() => InkWell(
                                        //                     onTap: () {
                                        //                       controller
                                        //                           .shippingCheckButtonOnTap(
                                        //                               getaddress);
                                        //                     },
                                        //                     child: Container(
                                        //                       height: 15,
                                        //                       width: 15,
                                        //                       alignment:
                                        //                           Alignment.center,
                                        //                       decoration: BoxDecoration(
                                        //                           border: Border.all(
                                        //                               color: Colors
                                        //                                   .black,
                                        //                               width: 1)),
                                        //                       child: getaddress
                                        //                               .isShipping!
                                        //                               .value
                                        //                           ? const Icon(
                                        //                               Icons.check,
                                        //                               size: 12,
                                        //                               color: Colors
                                        //                                   .black,
                                        //                             )
                                        //                           : Container(),
                                        //                     ),
                                        //                   )),
                                        //             ),
                                        //             const SizedBox(width: 0),
                                        //           ],
                                        //         )),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: CommonThemeButton(
                          onTap: () async {
                            bool result = await Get.toNamed(
                                RoutesConstants.addAddressScreen,
                                arguments: [
                                  controller.getAdressList.value,
                                  '',
                                  0
                                ]) as bool;
                            if (result) {
                              controller.getAddressList();
                            }
                          },
                          title: LanguageConstants.addNewText.tr,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
          ),
        ));
  }
}
