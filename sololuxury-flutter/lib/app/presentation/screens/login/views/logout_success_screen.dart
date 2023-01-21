import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class LogOutSuccess extends GetView<LoginController> {
  const LogOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {
          Get.offAllNamed<dynamic>(RoutesConstants.loginScreen);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: homeBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              LanguageConstants.youHaveBeenSuccessfullyLoggedOut.tr,
              style: AppStyle.textStyleUtils500(size: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonThemeButton(
               onTap: () async {
                  Get.offAllNamed<dynamic>(RoutesConstants.loginScreen);
                },
               title:
                  LanguageConstants.loginText.tr,
                 
              ),
              const SizedBox(
                width: 20,
              ),
              CommonThemeButton(
                onTap: () async {
                  Get.offAllNamed<dynamic>(RoutesConstants.dashboardScreen);
                },
              title:
                  LanguageConstants.continueShopping.tr,
                 
              ),
            ],
          )
        ],
      ),
    );
  }
}
