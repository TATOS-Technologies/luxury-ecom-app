import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/my_account/change_password_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.changePassword.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      PasswordWidget(
                        controller: controller.currentPasswordController.value,
                        hintText: LanguageConstants.currentPassword.tr,
                        maxLength: 40,
                        validator: (value) => Validators.validateRequired(
                            value.toString(),
                            '${LanguageConstants.currentPassword.tr} '),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordWidget(
                        controller: controller.passwordController.value,
                        hintText: LanguageConstants.passwordText.tr,
                        maxLength: 40,
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordWidget(
                        controller: controller.confirmPasswordController.value,
                        hintText: LanguageConstants.confirmPasswordText.tr,
                        maxLength: 40,
                        validator: (value) =>
                            Validators.validateConfirmPassword(value,
                                controller.passwordController.value.text),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryTextButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.changePassword();
                          }
                        },
                        title: LanguageConstants.commonUpdateText.tr,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
