import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/refer_friend_fields.dart';
import 'widgets/register_button.dart';
import 'widgets/successfully_widget.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  @override
  final ReferFriendController controller = Get.find();
  ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          title: Text(LanguageConstants.referFriendMyAccountText.tr),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Obx(
              () => controller.isSuccessfully.value
                  ? SuccessfullyWidget()
                  : GetBuilder<ReferFriendController>(
                      id: "refer",
                      builder: (controller) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                             CommonTextMontserrat(
                              LanguageConstants.enterDetailsBelowToSend.tr,
                              textAlign: TextAlign.center,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            SizedBox(height: 20.h),
                            const NameTextField(),
                            SizedBox(height: 15.h),
                            const EmailTextField(),
                            SizedBox(height: 15.h),
                            const PhoneTextField(),
                            SizedBox(height: 15.h),
                            const FriendFirstNameTextField(),
                            SizedBox(height: 15.h),
                            const FriendEmailTextField(),
                            SizedBox(height: 15.h),
                            const FriendPhoneTextField(),
                            SizedBox(height: 25.h),
                            RegisterButton(),
                          ],
                        );
                      },
                    ),
            ),
          ),
        ));
  }
}
