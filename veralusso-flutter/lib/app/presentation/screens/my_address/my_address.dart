import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/address_list/address_list.dart';
import 'package:veralusso/app/controller/my_address/my_address_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class MyAddressScreen extends GetView<MyAddressController> {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyAddressController controller = Get.find<MyAddressController>();

    return Obx(() => Scaffold(
          drawerEnableOpenDragGesture: false,
          appBar: commonAppbar(title: LanguageConstants.addressBookText.tr),
          // drawer: const Drawer(),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: Colors.black,
                  // size: 50.0,
                ))
              : ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount:
                            controller.getAdressList.value.addresses?.length,
                        itemBuilder: (BuildContext context, int index) {
                          Address? getaddress =
                              controller.getAdressList.value.addresses?[index];
                          return GestureDetector(
                              onTap: () async {
                                bool? result = await Get.toNamed(
                                    RoutesConstants.addAddress,
                                    arguments: [
                                      controller.getAdressList.value,
                                      getaddress,
                                      1
                                    ]);
                                if (result == true) {
                                  controller.getAddressList();
                                }
                              },
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: borderGrey, width: 2)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, right: 15.w),
                                              height: 50.h,
                                              width: double.infinity,
                                              decoration: const BoxDecoration(
                                                  color: borderGrey,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  children: [
                                                    CommonTextPoppins(
                                                      'Address ${index + 1}',
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                "${getaddress?.firstname}, ${getaddress?.lastname}, ${getaddress?.street?.first}, ${getaddress?.city}, ${getaddress?.postcode}",
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
                                                    controller.billingOnTap(
                                                        getaddress ??
                                                            Address());
                                                  },
                                                  child: Container(
                                                    height: 20.w,
                                                    width: 20.w,
                                                    padding:
                                                        EdgeInsets.all(2.w),
                                                    alignment: Alignment.center,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.shippingOnTap(
                                                          getaddress ??
                                                              Address());
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
                                                                  color:
                                                                      primary,
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
                                      ),
                                      SizedBox(
                                              height: 30.h,
                                            )
                                    ],
                                  )));
                        }),
                    const SizedBox(height: 40),
                    Text(
                      LanguageConstants.additionalAdressEntriesText.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils500(size: 14.sp),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        LanguageConstants.youhaveNoAddressText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(size: 12.sp),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: CommonThemeButton(
                        onTap: () async {
                          bool? result = await Get.toNamed(
                            RoutesConstants.addAddress,
                            arguments: [
                              controller.getAdressList.value,
                              '',
                              0,
                            ],
                          ) as bool;
                          if (result == true) {
                            controller.getAddressList();
                          }
                        },
                        title: LanguageConstants.addnewAddressText.tr,
                      ),
                    ),
                  ],
                ),
        ));
  }
}
