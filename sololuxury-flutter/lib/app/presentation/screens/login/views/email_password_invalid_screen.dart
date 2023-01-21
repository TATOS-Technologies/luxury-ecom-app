import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../widget/email_error.dart';
import '../widget/password_error.dart';

class EmailPasswordInvalidScreen extends StatelessWidget {
  const EmailPasswordInvalidScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Get.arguments is bool && Get.arguments as bool)
                  ? const EmailError()
                  : const PasswordError(),
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
                    LanguageConstants.continueShopping.tr,
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
                  Get.back<dynamic>();
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
