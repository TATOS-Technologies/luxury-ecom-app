import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class ForgetPasswordWrongEmailScreen extends StatelessWidget {
  ForgetPasswordWrongEmailScreen({Key? key}) : super(key: key);

  final ForgetPasswordMenuController forgetPasswordMenuController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  LanguageConstants.accountDoesNotExist.tr,
                  style: AppStyle.textStyleUtils600(),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.forgotPasswordWrongEmailStart.tr,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleUtils16(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.withText,
                        textAlign: TextAlign.center,
                        style: AppStyle.textStyleUtils16(),
                      ),
                      Text(
                        ' ${forgetPasswordMenuController.emailController.value.text}',
                        textAlign: TextAlign.center,
                        style: AppStyle.textStyleUtilsUnderLine14(),
                      ),
                    ],
                  ),
                  Text(
                    LanguageConstants.forgotPasswordWrongEmailEnd.tr,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleUtils16(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${LanguageConstants.writeAtText.tr}  ',
                        textAlign: TextAlign.center,
                        style: AppStyle.textStyleUtils16(),
                      ),
                      Text(
                        'care@sololuxury.com',
                        style: AppStyle.textStyleUtils400_16(color: buttoncolor)
                            .copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.continueShopping.tr.toUpperCase(),
                    // style: textStyleUtils18(),
                    style: AppStyle.textStyleUtils600(
                      color: Colors.white,
                      size: 13.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.until((route) =>
                      route.settings.name == RoutesConstants.loginScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    LanguageConstants.backToSignInScreen.tr.toUpperCase(),
                    // style: textStyleUtils18(),
                    style: AppStyle.textStyleUtils600(
                      color: Colors.white,
                      size: 13.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
