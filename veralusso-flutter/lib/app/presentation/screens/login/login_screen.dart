import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/login/login_controller.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/login_criteria.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/login_field.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/register_criteria.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  final LoginController controller = Get.find();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: whiteColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Column(
                  children: [
                    // commonAppbar(title: LanguageConstant.loginText.tr),
          
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(24.w),
                        child: GetBuilder<LoginController>(
                          id: "Login",
                          builder: (controller) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 90.h,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      LanguageConstants.loginText.tr,
                                      style: AppTextStyle.textStyleUtils600(
                                          size: 30.sp),
                                    )),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                LoginTextFormFields(),
                                LoginCriteria(),
                                // const ShoppingSaveDetail(),
                                const RegisterCriteria(),
                                SizedBox(
                                  height: 60.h,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          controller.isLoading.value
              ? const ScreenLoading()
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
