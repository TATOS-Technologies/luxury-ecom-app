import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class StartChatButton extends GetView<MyAccountController> {
  const StartChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: CommonThemeButton(
        onTap: () {
          controller.isSubmitButtonPressed = true;
          controller.update(["msg"]);
          if (controller.formKey.currentState?.validate() ?? false) {
            Livechat.beginChat(
              AppConstants.licenceId,
              '1',
              controller.firstNameController.text.trim(),
              controller.emailController.text.trim(),
              {},
            );
          }
        },
        title: LanguageConstants.startChatText.tr,
      ),
    );
  }
}
