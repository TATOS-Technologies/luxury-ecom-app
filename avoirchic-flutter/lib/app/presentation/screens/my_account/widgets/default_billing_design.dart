import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/my_account_information_controller.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';

class DefaultBillingDesign extends GetView<MyAccountInformationController> {
  const DefaultBillingDesign({Key? key}) : super(key: key);

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
                LanguageConstants.defaultBillingAddress.tr,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 5, right: 50),
                      child: Text(
                        controller.defaultBilling,
                        style: AppTextStyle.textStyleUtils300_16(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5),
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
                              title: LanguageConstants.editAddress.tr)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
