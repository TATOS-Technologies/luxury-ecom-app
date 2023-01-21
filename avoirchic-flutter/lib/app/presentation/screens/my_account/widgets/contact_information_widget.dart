import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/my_account_information_controller.dart';
import '../../../../main/main.common.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';

class ContactInformation extends GetView<MyAccountInformationController> {
  const ContactInformation({Key? key}) : super(key: key);

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
          Column(
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
                    LanguageConstants.contactInfo.tr,
                    style: AppTextStyle.textStyleUtils500(
                        color: primary, size: 14.sp),
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
                    Text(
                      "${localStore.userDetail.firstname}"
                      "${localStore.userDetail.lastname}",
                      style: AppTextStyle.textStyleUtils400(size: 14.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      localStore.userDetail.email ?? '',
                      style: AppTextStyle.textStyleUtils400(size: 14.sp),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 80.w,
                            height: 35.w,
                            child: CommonThemeButton(
                                onTap: () {},
                                title: LanguageConstants.edit.tr)),
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
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
