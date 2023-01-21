import 'package:avoirchic/app/controller/signup_controller.dart';
import 'package:avoirchic/app/presentation/screens/signup/widgets/common_text_fields.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/utils/lang_directory/language_constant.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return !controller.isSignUpApiCall.value;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: appBGColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.0),
                    child: Form(
                      key: controller.formKey.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LanguageConstants.signUpText.tr,
                                style:
                                    AppTextStyle.textStyleUtils600(size: 30.sp),
                              )),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const FirstNameTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const LastNameTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const EmailTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const ConfirmEmailTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const PasswordTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const ConfirmPasswordTextFormFields(),
                          SizedBox(
                            height: 15.w,
                          ),
                          const DateOfBirthTextFormFields(),
                          // SizedBox(
                          //   height: 15.w,
                          // ),
                          // const MarriageAnniversaryTextFormFields(),
                          SizedBox(
                            height: 30.w,
                          ),
                          SizedBox(width: 327.w, child: const Agreement()),
                          SizedBox(
                            height: 20.w,
                          ),
                          const CreateAnAccountButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
