import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class ForgetPasswordMenuScreen extends StatelessWidget {
  const ForgetPasswordMenuScreen({Key? key}) : super(key: key);

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
                onTap: () {
                  // controller.getForgetPasswordResponse();
                },
                child: Text(
                  LanguageConstants.pleaseCheckYourInbox.tr,
                  style: AppStyle.textStyleUtilsUnderline600(),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                firstCapitalize(LanguageConstants.forgetPasswordContain.tr),
                textAlign: TextAlign.center,
                style: AppStyle.textStyleUtils16(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.writeAtText.tr,
                    textAlign: TextAlign.center,
                    style: AppStyle.textStyleUtils16(),
                  ),
                  Text(
                    'care@sololuxury.com',
                    style: AppStyle.textStyleUtils400_16(color: buttoncolor)
                        .copyWith(
                      decoration: TextDecoration.underline,
                      fontFamily: AppConstants.fontOpenSans,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
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
                    LanguageConstants.continueShopping.tr,
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
                    LanguageConstants.backToSignInScreen.tr,
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

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }
}
