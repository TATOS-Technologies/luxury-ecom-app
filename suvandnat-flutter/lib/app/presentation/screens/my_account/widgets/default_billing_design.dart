import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_account/my_account_information_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class DefaultBillingDesign extends GetView<MyAccountInformationController> {
  const DefaultBillingDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
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
      alignment: Alignment.centerLeft,
    );
  }
}
