import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/controller/my_account/my_account_information_controller.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class DefaultBillingDesign extends GetView<MyAccountInformationController> {
  const DefaultBillingDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: homeBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appTileBorderColor, width: 2)),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.w,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: appTileBGcolor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: CommonTextPoppins(
                    LanguageConstants.defaultBillingAddress.tr,
                    fontSize: 14.sp,
                    color: appColorPrimary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 15.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 10.w, right: 50.w),
            child: Text(
              controller.defaultBilling,
              style: AppStyle.textStyleUtils300(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.w),
            child: Text(
              controller.billingTelephone,
              style: AppStyle.textStyleUtils300_14(color: grey6D6D6D),
            ),
          ),
          Center(
            child: SizedBox(
              child: CommonThemeButton(
               onTap: () async {
                  log(controller.defaultBillingAddress.id.toString(),
                      name: "defaultShipping");
                  dynamic result = await Get.toNamed<dynamic>(
                      RoutesConstants.addAdressScreen,
                      arguments: [
                        controller.myAccountModel.value,
                        controller.defaultBillingAddress,
                        controller.defaultBillingAddress.id != null ? 1 : 0,
                        controller.defaultBillingAddress.id != null
                            ? null
                            : 'billing'
                      ]);
                  if (result != null && result is bool) {
                    await controller.getMyAccountDataFromApi();
                  }
                },
                title:
                  controller.defaultBillingAddress.id != null
                      ? LanguageConstants.editAddress.tr
                      : LanguageConstants.addAddress.tr,
                 
                
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
