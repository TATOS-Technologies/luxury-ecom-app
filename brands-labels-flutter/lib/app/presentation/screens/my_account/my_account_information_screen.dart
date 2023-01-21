import 'package:brandslabels/app/controller/my_account_information_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_routes.dart';

class MyAccountInformationScreen
    extends GetView<MyAccountInformationController> {
  const MyAccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar:
            commonAppbar(title: LanguageConstants.accountInformationText.tr),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: Color(0xff000080),
              ))
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          'Hey,',
                          style: AppTextStyle.textStyleUtils500(size: 24.sp),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Text(
                          localStore.userDetail.firstname.toString(),
                          style: AppTextStyle.textStyleUtils600(size: 24.sp),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      contactInformationWidget(),
                      SizedBox(
                        height: 30.h,
                      ),
                      newsLettersDesign(),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         LanguageConstants.addressBookText.tr,
                      //         style: AppTextStyle.textStyleUtilsUnderLine20(
                      //             fontWeight: FontWeight.w600),
                      //       ),

                      //       InkWell(
                      //         onTap: () {
                      //           Get.toNamed(RoutesConstants.myAddressScreen);
                      //         },
                      //         child: Text(
                      //           LanguageConstants.manageAddresses.tr,
                      //           style: AppTextStyle.textStyleUtilsUnderLine14(),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      defaultShippingDesign(),
                      SizedBox(
                        height: 30.h,
                      ),
                      defaultBillingDesign(),
                      SizedBox(
                        height: 30.h,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget defaultBillingDesign() {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  LanguageConstants.defaultBillingAddress.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 50),
            child: Text(
              controller.defaultBilling,
              style: AppTextStyle.textStyleUtils300_16(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              controller.billingTelephone,
              style: AppTextStyle.textStyleUtils300_16(),
            ),
          ),
          Center(
            child: SizedBox(
              height: 35.w,
              width: 200.w,
              child: CommonThemeButton(
                onTap: () async {
                  bool result = await Get.toNamed(
                      RoutesConstants.addAddressScreen,
                      arguments: [
                        controller.myAccountModel.value,
                        controller.defaultBillingAddress,
                        1
                      ]) as bool;
                  if (result) {
                    await controller.getMyAccountDataFromApi();
                  }
                },
                title: LanguageConstants.editAddress.tr,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
        ],
      ),
    );
  }

  Widget defaultShippingDesign() {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Text(
                  LanguageConstants.defaultShippingAddress.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 50),
            child: SizedBox(
              child: Text(
                controller.defaultShipping,
                style: AppTextStyle.textStyleUtils300_16(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              controller.shippingTelephone,
              style: AppTextStyle.textStyleUtils300_16(),
            ),
          ),
          Center(
            child: SizedBox(
              height: 35.w,
              width: 200.w,
              child: CommonThemeButton(
                onTap: () async {
                  bool result = await Get.toNamed(
                      RoutesConstants.addAddressScreen,
                      arguments: [
                        controller.myAccountModel.value,
                        controller.defaultShippingAddress,
                        1
                      ]) as bool;
                  if (result) {
                    await controller.getMyAccountDataFromApi();
                  }
                },
                title: LanguageConstants.editAddress.tr,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          )
        ],
      ),
    );
  }

  Widget contactInformationWidget() {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                LanguageConstants.contactInformation.tr,
                style:
                    AppTextStyle.textStyleUtils500(color: primary, size: 14.sp),
              ),
            ),
          ),
          const Divider(
            color: borderGrey,
            height: 2,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${localStore.userDetail.firstname}"
                    "${localStore.userDetail.lastname}",
                    style: AppTextStyle.textStyleUtils300_16(),
                  ),
                ),
                Text(
                  localStore.userDetail.email ?? '',
                  style: AppTextStyle.textStyleUtils300_16(),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 80.w,
                  height: 35.w,
                  child: CommonThemeButton(
                      onTap: () {}, title: LanguageConstants.edit.tr)),
              SizedBox(
                width: 16.w,
              ),
              SizedBox(
                  height: 35.w,
                  child: CommonThemeButton(
                      isOutLined: true,
                      buttonColor: whiteColor,
                      textColor: primary,
                      onTap: () {
                        Get.toNamed<dynamic>(
                            RoutesConstants.changePasswordScreen);
                      },
                      title: LanguageConstants.changePassword.tr)),
            ],
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  Widget newsLettersDesign() {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrey, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: blueTileColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  LanguageConstants.newsLetters.tr,
                  style: AppTextStyle.textStyleUtils500(
                      color: primary, size: 14.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 40),
            child: Text(
              LanguageConstants.newsLettersContain.tr,
              style: AppTextStyle.textStyleUtils300_16(),
            ),
          ),
          Center(
            child: SizedBox(
              height: 35.w,
              width: 200.w,
              child: CommonThemeButton(
                onTap: () {
                  Get.toNamed(RoutesConstants.newsLetterScreen);
                },
                title: LanguageConstants.edit.tr,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
