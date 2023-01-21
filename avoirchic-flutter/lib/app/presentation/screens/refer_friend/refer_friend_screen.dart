import 'package:avoirchic/app/controller/refer_friend_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/screens/refer_friend/widgets/common_text_field.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_widget/common_text_poppins.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageConstants.referFriendText.tr),
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(Get.context!).viewPadding.top),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Obx(() => controller.isSuccessfully.value
                    ? const Successfully()
                    : GetBuilder<ReferFriendController>(
                        id: "refer",
                        builder: (controller) {
                          return Column(
                            children: [
                              // commonAppbar(appBarColor: Colors.transparent),
                              // const SizedBox(height: 20),
                              // Text(LanguageConstants.referFriendText.tr,
                              //     style: AppTextStyle.textStyleUtils500_16()),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: CommonTextPoppins(
                                  LanguageConstants.enterDetailsBelowToSend.tr,
                                  textAlign: TextAlign.center,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.5),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    const NameTextField(),
                                    SizedBox(height: 12.h),
                                    const EmailTextField(),
                                    SizedBox(height: 12.h),
                                    const PhoneTextField(),
                                    SizedBox(height: 12.h),
                                    const FriendFirstNameTextField(),
                                    SizedBox(height: 12.h),
                                    const FriendEmailTextField(),
                                    SizedBox(height: 12.h),
                                    const FriendPhoneTextField(),
                                    SizedBox(height: 25.h),
                                    const RegisterButton(),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
