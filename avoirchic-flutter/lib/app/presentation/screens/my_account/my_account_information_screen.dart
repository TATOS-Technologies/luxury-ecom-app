import 'package:avoirchic/app/controller/my_account_information_controller.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/screens/my_account/widgets/contact_information_widget.dart';
import 'package:avoirchic/app/presentation/screens/my_account/widgets/default_shipping_design.dart';
import 'package:avoirchic/app/presentation/screens/my_account/widgets/newsletters_design.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';
import 'widgets/default_billing_design.dart';

class MyAccountInformationScreen
    extends GetView<MyAccountInformationController> {
  const MyAccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(LanguageConstants.myAccount.tr),
        ),
        backgroundColor: Colors.transparent,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: Color(0xff367587),
                  // size: 50.0,
                ))
              : Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.all(24.w),
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
                        const ContactInformation(),
                        SizedBox(
                          height: 25.h,
                        ),
                        const NewsLettersDesign(),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const DefaultShippingDesign(),
                        SizedBox(
                          height: 25.h,
                        ),
                        const DefaultBillingDesign(),
                        SizedBox(
                          height: 25.h,
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
