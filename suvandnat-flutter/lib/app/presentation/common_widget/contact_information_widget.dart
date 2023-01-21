import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:get/get.dart';
import '../../main/main.common.dart';
import '../../theme/colors.dart';

class CommonContactInformationWidget extends StatelessWidget {
  const CommonContactInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: borderGrey, width: 2),
      ),
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
              // const Divider(
              //   color: borderGrey,
              //   height: 2,
              //   thickness: 2,
              // ),
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
                        style: AppTextStyle.commonTextStyle300,
                      ),
                    ),
                    Text(
                      localStore.userDetail.email ?? '',
                      style: AppTextStyle.commonTextStyle300,
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 80.w,
                            height: 35.w,
                            child:
                                CommonThemeButton(onTap: () {}, title: LanguageConstants.edit.tr)),
                        SizedBox(
                          width: 16.w,
                        ),
                        SizedBox(
                            height: 35.w,
                            child: CommonThemeButton(
                                isOutLined: true,
                                buttonColor: whiteColor,
                                textColor: primary,
                                onTap: () {},
                                title: LanguageConstants.changePassword.tr)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          // Container(
          //   width: Get.width,
          //   margin: const EdgeInsets.only(right: 10, top: 30),
          //   alignment: Alignment.centerLeft,
          //   decoration: const BoxDecoration(
          //     color: appDividerColor,
          //   ),
          //   padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          //   child: IntrinsicHeight(
          //     child: Row(
          //       children: const [
          //         Text(
          //           "Edit",
          //           style: AppTextStyle.commonTextStyle300,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.symmetric(vertical: 2.0),
          //           child: VerticalDivider(color: red973133),
          //         ),
          //         Text(
          //           "Change Password",
          //           style: AppTextStyle.commonTextStyle300,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
