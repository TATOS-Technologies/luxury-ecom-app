import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/email_error_widget.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/password_error_widget.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPasswordInvalidScreen extends StatelessWidget {
  const EmailPasswordInvalidScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: avoirChickTheme,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (Get.arguments is bool && Get.arguments as bool)
                  ? const EmailErrorWidget()
                  : const PasswordErrorWidget(),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(RoutesConstants.dashboardScreen);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: appTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: CommonTextOpenSans(
                  LanguageConstants.backToSignInScreen.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
