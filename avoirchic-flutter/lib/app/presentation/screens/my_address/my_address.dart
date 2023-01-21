import 'package:avoirchic/app/controller/my_address_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AddressBookScreen extends GetView<AddressBookController> {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              title: Text(LanguageConstants.addressBookText.tr),
            ),
            body: Column(
              children: [
                // commonAppbar(appBarColor: Colors.transparent),
                // Text(
                //   LanguageConstants.addressBookText.tr,
                //   style: AppTextStyle.textStyleUtils300_16(),
                // ),
                controller.isLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                          color: Color(0xff367587),
                        ),
                      )
                    : controller.getAdressList.value.addresses!.isNotEmpty
                        ? Container(
                            color: Colors.transparent,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.symmetric(
                                //     vertical: 16.0,
                                //     horizontal: 14.0,
                                //   ),
                                //   // color: Color(0xffF5E5DD),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         flex: 3,
                                //         child: Row(
                                //           children: [
                                //             Text(
                                //               LanguageConstants
                                //                   .addressText.tr,
                                //               style: AppTextStyle
                                //                   .textStyleUtils400(),
                                //             ),
                                //             const SizedBox(width: 4),
                                //             Image.asset(
                                //               AppAsset.editPenWithLineIcon,
                                //               height: 20,
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //       Expanded(
                                //           flex: 2,
                                //           child: Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment
                                //                     .spaceBetween,
                                //             children: [
                                //               Text(
                                //                 LanguageConstants
                                //                     .billingTxet.tr,
                                //                 style: AppTextStyle
                                //                     .textStyleUtils400(),
                                //               ),
                                //               Text(
                                //                 LanguageConstants
                                //                     .shippingText.tr,
                                //                 style: AppTextStyle
                                //                     .textStyleUtils400(),
                                //               ),
                                //             ],
                                //           )),
                                //     ],
                                //   ),
                                // ),
                                SizedBox(height: 10.h),
                                ListView.builder(
                                  padding: EdgeInsets.all(24.w),
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: controller
                                      .getAdressList.value.addresses!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final getaddress = controller
                                        .getAdressList.value.addresses![index];
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 20.w),
                                      child: InkWell(
                                        onTap: () async {
                                          bool result = await Get.toNamed(
                                            RoutesConstants.addAddressScreen,
                                            arguments: [
                                              controller.getAdressList.value,
                                              getaddress,
                                              1
                                            ],
                                          ) as bool;
                                          debugPrint(
                                              "This is back result $result");
                                          if (result) {
                                            controller.getAddressList();
                                          }
                                        },
                                        child:
                                            GetBuilder<AddressBookController>(
                                          builder: (c) {
                                            return Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: borderGrey,
                                                          width: 2)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20.w,
                                                                right: 15.w),
                                                        height: 40.h,
                                                        width: double.infinity,
                                                        decoration: const BoxDecoration(
                                                            color: borderGrey,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10))),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Row(
                                                            children: [
                                                              CommonTextPoppins(
                                                                'Address ${index + 1}',
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: primary,
                                                              ),
                                                              const Spacer(),
                                                              InkWell(
                                                                onTap: () {
                                                                  // controller
                                                                  //     .deleteAddressOnTap(
                                                                  //         address);
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    size: 25,
                                                                    color:
                                                                        appColor,
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child:
                                                            CommonTextPoppins(
                                                          controller
                                                              .getTextForName(
                                                                  getaddress),
                                                          fontSize: 14.sp,
                                                          color: primary,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.w),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  border: Border.all(
                                                                      color:
                                                                          appColor,
                                                                      width:
                                                                          2)),
                                                              child: controller
                                                                      .getAdressList
                                                                      .value
                                                                      .addresses![
                                                                          index]
                                                                      .isBilling!
                                                                      .value
                                                                  ? Container(
                                                                      decoration: BoxDecoration(
                                                                          color:
                                                                              primary,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.sp)),
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
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: primary,
                                                          ),
                                                          SizedBox(width: 40.w),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
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
                                                                    EdgeInsets
                                                                        .all(2
                                                                            .w),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                    border: Border.all(
                                                                        color:
                                                                            appColor,
                                                                        width:
                                                                            2)),
                                                                child: controller
                                                                        .getAdressList
                                                                        .value
                                                                        .addresses![
                                                                            index]
                                                                        .isShipping!
                                                                        .value
                                                                    ? Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.sp)),
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
                                                                .defaultShipping
                                                                .tr,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: primary,
                                                          ),
                                                          const SizedBox(
                                                              width: 0),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 30.h,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // Row(
                                                //   children: [
                                                //     Expanded(
                                                //       flex: 3,
                                                //       child: Text(
                                                //         controller.getTextForName(
                                                //             getaddress),
                                                //         style: AppTextStyle
                                                //             .textStyleUtils400(),
                                                //       ),
                                                //     ),
                                                //     Expanded(
                                                //       flex: 2,
                                                //       child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceAround,
                                                //         children: [
                                                //           Obx(() => InkWell(
                                                //                 onTap: () {
                                                //                   controller
                                                //                       .billingCheckButtonOnTap(
                                                //                           getaddress);
                                                //                 },
                                                //                 child: Container(
                                                //                   height: 16,
                                                //                   width: 16,
                                                //                   alignment:
                                                //                       Alignment
                                                //                           .center,
                                                //                   decoration:
                                                //                       BoxDecoration(
                                                //                     border: Border
                                                //                         .all(
                                                //                       color: Colors
                                                //                           .black,
                                                //                       width: 1,
                                                //                     ),
                                                //                   ),
                                                //                   child: controller
                                                //                           .getAdressList
                                                //                           .value
                                                //                           .addresses![
                                                //                               index]
                                                //                           .isBilling!
                                                //                           .value
                                                //                       ? const Icon(
                                                //                           Icons
                                                //                               .check,
                                                //                           size:
                                                //                               12,
                                                //                           color: Colors
                                                //                               .black,
                                                //                         )
                                                //                       : Container(),
                                                //                 ),
                                                //               )),
                                                //           const SizedBox(
                                                //               width: 0),
                                                //           Padding(
                                                //             padding:
                                                //                 const EdgeInsets
                                                //                         .only(
                                                //                     left: 20.0),
                                                //             child:
                                                //                 Obx(() => InkWell(
                                                //                       onTap: () {
                                                //                         controller
                                                //                             .shippingCheckButtonOnTap(
                                                //                                 getaddress);
                                                //                       },
                                                //                       child:
                                                //                           Container(
                                                //                         height:
                                                //                             16,
                                                //                         width: 16,
                                                //                         alignment:
                                                //                             Alignment
                                                //                                 .center,
                                                //                         decoration: BoxDecoration(
                                                //                             border: Border.all(
                                                //                                 color: Colors.black,
                                                //                                 width: 1)),
                                                //                         child: controller
                                                //                                 .getAdressList
                                                //                                 .value
                                                //                                 .addresses![
                                                //                                     index]
                                                //                                 .isShipping!
                                                //                                 .value
                                                //                             ? const Icon(
                                                //                                 Icons.check,
                                                //                                 size: 14,
                                                //                                 color: Colors.black)
                                                //                             : Container(),
                                                //                       ),
                                                //                     )),
                                                //           ),
                                                //           const SizedBox(
                                                //               width: 0),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
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
                                        ],
                                      ) as bool;
                                      if (result) {
                                        controller.getAddressList();
                                      }
                                    },
                                    title: LanguageConstants.addAddress.tr,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const NothigToShowAnimationWidget(),
                                Text(
                                  LanguageConstants.noAddressFound.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 14.sp),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                CommonThemeButton(
                                  onTap: () async {
                                    bool result = await Get.toNamed(
                                      RoutesConstants.addAddressScreen,
                                      arguments: [
                                        controller.getAdressList.value,
                                        '',
                                        0
                                      ],
                                    ) as bool;
                                    if (result) {
                                      controller.getAddressList();
                                    }
                                  },
                                  title: LanguageConstants.addAddress.tr,
                                ),
                                SizedBox(
                                  height: 90.h,
                                )
                              ],
                            ),
                          ),
              ],
            )),
      ),
    );
  }
}
