import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/forgot_password_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/login/widget/reset_password_button.dart';

class ForgotPasswordScreen extends GetView<ForgetPasswordMenuController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        appBar:
            commonAppbar(title: LanguageConstants.forgotYourPasswordText.tr),
        body: controller.isLoading.value
            ? const SpinKitThreeBounce(
                color: appColor,
              )
            : Form(
                key: controller.formKey.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              LanguageConstants
                                  .forgotYourPasswordDescriptionText.tr,
                              textAlign: TextAlign.center,
                              style: AppStyle.textStyleUtils400_16(),
                            ),
                            const SizedBox(height: 30),
                            const ForgotPasswordTextField(),
                            const SizedBox(height: 30),
                            const ResetPasswordButton(),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Get.until((route) =>
                                    route.settings.name ==
                                    RoutesConstants.loginScreen);
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.arrow_back_ios,
                                      color: appColor,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 1),
                                    Text(
                                      LanguageConstants.backText.tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.textStyleUtils400_16(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
