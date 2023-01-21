import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/my_address_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:brandslabels/app/theme/colors.dart';

class MyAddressScreen extends GetView<MyAddressController> {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressController controller = Get.find<MyAddressController>();

    return Obx(() => Scaffold(
          appBar: commonAppbar(
            title: LanguageConstants.myAddresses.tr,
          ),
          drawer: const Drawer(),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: darkBlue,
                  ),
                )
              : controller.getAdressList.value.addresses?.isNotEmpty == true
                  ? ListView(children: [
                      const SizedBox(height: 20),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 16.0, horizontal: 14.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: 3,
                      //         child: Text(
                      //           LanguageConstants.addressText.tr,
                      //           style: AppTextStyle.textStyleUtils500_16(),
                      //         ),
                      //       ),
                      //       Expanded(
                      //           flex: 2,
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 LanguageConstants.billingText.tr,
                      //                 style: AppTextStyle.textStyleUtils500(),
                      //               ),
                      //               Text(
                      //                 LanguageConstants.shippingText.tr,
                      //                 style: AppTextStyle.textStyleUtils500(),
                      //               ),
                      //             ],
                      //           )),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: controller.getAdressList.value.addresses?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final getaddress = controller
                                .getAdressList.value.addresses![index];
                            return Padding(
                              padding:  EdgeInsets.only(bottom: 30.w),
                              child: GestureDetector(
                                onTap: () async {
                                  bool result = await Get.toNamed(
                                    RoutesConstants.addAddressScreen,
                                    arguments: [
                                      controller.getAdressList.value,
                                      getaddress,
                                      1
                                    ],
                                  ) as bool;
                                  if (result) {
                                    controller.getAddressList();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12),
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
                                                              left: 20.w,
                                                              right: 15.w),
                                                          height: 40.h,
                                                          width: double.infinity,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  blueTileColor,
                                                              borderRadius:
                                                                  BorderRadius.only(
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
                                                                      Icons.delete,
                                                                      size: 25,
                                                                      color:
                                                                          primary,
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
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 20.w),
                                                          child: CommonTextPoppins(
                                                            controller.getTextForName(
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
                                                                    EdgeInsets.all(
                                                                        2.w),
                                                                alignment: Alignment
                                                                    .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                20),
                                                                    border: Border.all(
                                                                        color:
                                                                            primary,
                                                                        width: 2)),
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
                                                                          .all(2.w),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  20),
                                                                      border: Border.all(
                                                                          color:
                                                                              primary,
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
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 3,
                                      //       child: Text(
                                      //         controller.getTextForName(getaddress),
                                      //         style:
                                      //             AppTextStyle.textStyleUtils400_16(),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //         flex: 2,
                                      //         child: GetBuilder<MyAddressController>(
                                      //           builder: (C) {
                                      //             return Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment.spaceAround,
                                      //               children: [
                                      //                 Obx(() => InkWell(
                                      //                       onTap: () {
                                      //                         controller
                                      //                             .billingCheckButtonOnTap(
                                      //                                 getaddress);
                                      //                       },
                                      //                       child: Container(
                                      //                         height: 20,
                                      //                         width: 20,
                                      //                         alignment:
                                      //                             Alignment.center,
                                      //                         decoration:
                                      //                             BoxDecoration(
                                      //                           border: Border.all(
                                      //                             color: const Color(
                                      //                                     0xff000040)
                                      //                                 .withOpacity(
                                      //                                     0.6),
                                      //                             width: 2,
                                      //                           ),
                                      //                         ),
                                      //                         child: controller
                                      //                                 .getAdressList
                                      //                                 .value
                                      //                                 .addresses![
                                      //                                     index]
                                      //                                 .isBilling!
                                      //                                 .value
                                      //                             ? const Icon(
                                      //                                 Icons.check,
                                      //                                 size: 14,
                                      //                                 color: Color(
                                      //                                     0xff000040))
                                      //                             : Container(),
                                      //                       ),
                                      //                     )),
                                      //                 const SizedBox(width: 0),
                                      //                 Padding(
                                      //                   padding:
                                      //                       const EdgeInsets.only(
                                      //                           left: 20.0),
                                      //                   child: Obx(() => InkWell(
                                      //                         onTap: () {
                                      //                           controller
                                      //                               .shippingCheckButtonOnTap(
                                      //                                   getaddress);
                                      //                         },
                                      //                         child: Container(
                                      //                           height: 20,
                                      //                           width: 20,
                                      //                           alignment:
                                      //                               Alignment.center,
                                      //                           decoration:
                                      //                               BoxDecoration(
                                      //                             border: Border.all(
                                      //                               color: const Color(
                                      //                                       0xff000040)
                                      //                                   .withOpacity(
                                      //                                       0.6),
                                      //                               width: 2,
                                      //                             ),
                                      //                           ),
                                      //                           child: controller
                                      //                                   .getAdressList
                                      //                                   .value
                                      //                                   .addresses![
                                      //                                       index]
                                      //                                   .isShipping!
                                      //                                   .value
                                      //                               ? const Icon(
                                      //                                   Icons.check,
                                      //                                   size: 14,
                                      //                                   color: Color(
                                      //                                       0xff000040),
                                      //                                 )
                                      //                               : Container(),
                                      //                         ),
                                      //                       )),
                                      //                 ),
                                      //                 const SizedBox(width: 0),
                                      //               ],
                                      //             );
                                      //           },
                                      //         )),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 30.h,),
                      Center(
                        child: SizedBox(
                          height: 35.w,
                          width: 120.w,
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
                      ),
                    ])
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const NothigToShowAnimationWidget(),
                        Text(
                          LanguageConstants.noAddressFound.tr,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 35.w,
                          width: 120.w,
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
                        SizedBox(
                          height: 90.h,
                        ),
                      ],
                    ),
        ));
  }
}
