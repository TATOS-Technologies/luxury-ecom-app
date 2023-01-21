import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/my_account/my_account_information_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/contact_information_widget.dart';
import 'package:suvandnat/app/presentation/screens/my_account/widgets/default_billing_design.dart';
import 'package:suvandnat/app/presentation/screens/my_account/widgets/default_shipping_design.dart';
import 'package:suvandnat/app/presentation/screens/my_account/widgets/newsletters_design.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class MyAccountInformationScreen
    extends GetView<MyAccountInformationController> {
  const MyAccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        appBar: commonAppbar(
          title: LanguageConstants.accountInformationText.tr,
        ),
        backgroundColor: Colors.transparent,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xFF973133),
                  ),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(24.w),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Text(
                            LanguageConstants.helloText.tr,
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
                        const CommonContactInformationWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const NewsLettersDesign(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DefaultShippingDesign(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const DefaultBillingDesign(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
