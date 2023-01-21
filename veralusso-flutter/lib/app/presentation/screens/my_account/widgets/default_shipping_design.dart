import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_information_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class DefaultShippingDesign extends GetView<MyAccountInformationController> {
  @override
  final MyAccountInformationController controller = Get.find();
  DefaultShippingDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                LanguageConstants.defaultShippingAddress.tr,
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
          controller.defaultShipping.isNotEmpty &&
                  controller.shippingTelephone.isNotEmpty
              ? Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.defaultShipping,
                        style: AppStyle.commonTextStyle300(),
                      ),
                      SizedBox(height: 10.w,),

                      Text(
                        controller.shippingTelephone,
                        style: AppTextStyle.textStyleUtils300_16(),
                      ),
                      SizedBox(height: 20.w,),
                      Center(
                      child: SizedBox(
                        height: 35.w,
                        width: 200.w,
                        child: CommonThemeButton(
                          onTap: () async {
                            var result = await Get.toNamed(
                              RoutesConstants.addAddress,
                              arguments: [
                                controller.myAccountModel.value,
                                controller.defaultShippingAddress,
                                1
                              ]);
                          if (result == true) {
                            await controller.getMyAccountDataFromApi();
                          }
                          },
                          title: LanguageConstants.editAddress.tr,
                        ),
                      ),
                    ),
                    
                    ],
                  ),
              )
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 30, right: 50, top: 20),
                  child: Text(
                    LanguageConstants.notSetDefaultShipping.tr,
                    style: AppStyle.commonTextStyle300(),
                  ),
                ),
        ],
      ),
    );
  }
}
