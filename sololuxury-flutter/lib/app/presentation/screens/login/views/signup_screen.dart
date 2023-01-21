import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/confirm_password_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/password_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/sur_name_text_field.dart';

import '../widget/email_text_field.dart';
import '../widget/marriage_anniversary_text_field.dart';
import '../widget/name_text_field.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: homeBackground,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: homeBackground,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Form(
            key: controller.formKey.value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.5),
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Text(
                                  controller.isRegister!.value
                                      ? LanguageConstants.editUser.tr
                                      : LanguageConstants.signUpText.tr,
                                  style: AppStyle.textStyleUtils600(size: 30),
                                ),
                              )),
                          SizedBox(height: 40.w),
                          const EmailTextField(),
                          SizedBox(height: 14.h),
                          if(!controller.isRegister!.value)const PasswordTextField(),
                          if(!controller.isRegister!.value)SizedBox(height: 14.h),
                          if(!controller.isRegister!.value)const ConfirmPasswordTextField(),
                          if(!controller.isRegister!.value)SizedBox(height: 14.h),
                          const NameTextField(),
                          SizedBox(height: 14.h),
                          const SurNameTextField(),
                          SizedBox(height: 14.h),
                          // const MarriageAnniversaryTextField(),
                          if(!controller.isRegister!.value)SizedBox(height: 14.h),
                          if(!controller.isRegister!.value)const DateOfBirthTextField(),

                          if(!controller.isRegister!.value)const UserAgrementWidget(),
                          const SizedBox(height: 25),
                          SizedBox(
                            child: CommonThemeButton(
                              onTap: () {
                                if (controller.isRegister!.value) {
                                  controller.onSave(context);
                                } else {
                                  controller.registerUser(context);
                                }
                              },
                              title: controller.isRegister!.value
                                  ? LanguageConstants.save.tr
                                  : LanguageConstants.createAccountText.tr,
                            ),
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(
                              color: appColor,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class UserAgrementWidget extends GetView<SignupController> {
  const UserAgrementWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
        children: [
          SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    splashRadius: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: controller.newsLetter.value,
                    onChanged: (value) {
                      controller.newsLetter.value = value!;
                    },
                  ),
                ),
              ),
              SizedBox(
                  width: 280.w,
                  child:
                      Text(LanguageConstants.marketingPurposeTextSoloLuxury.tr)),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    splashRadius: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    value: controller.isAgred.value,
                    onChanged: (value) {
                      controller.isAgred.value = value!;
                    },
                  ),
                ),
              ),
              SizedBox(
                  width: 280.w,
                  child: Text(LanguageConstants.shoppingHabitTextSoloLuxury.tr)),
            ],
          ),
        ],
      ),
    );
  }
}
