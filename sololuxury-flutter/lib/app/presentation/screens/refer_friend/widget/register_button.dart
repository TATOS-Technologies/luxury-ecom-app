import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class RegisterButton extends GetView<ReferFriendController> {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonThemeButton(
      onTap: () async {
        FocusScope.of(Get.context!).requestFocus(FocusNode());
        await controller.referAFriendOnTap();
      },
     title:
        LanguageConstants.register.tr,
        
    );
  }
}
