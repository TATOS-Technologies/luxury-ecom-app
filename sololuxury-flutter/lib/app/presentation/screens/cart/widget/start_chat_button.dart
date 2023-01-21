import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return SizedBox(
        width: 180,
        height: 41,
        child: ElevatedButton(
          onPressed: () {
            controller.isSubmitButtonPressed = true;
            if (controller.formKey.currentState?.validate() ?? false) {
              controller.clickChatEvent(
                name: controller.firstNameController.text.trim(),
                email: controller.emailController.text.trim(),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: appColor,
          ),
          child: Text(
            LanguageConstants.startChatText.tr,
            style: AppStyle.textStyleUtils400(size: 14, color: Colors.white),
          ),
        ),
      );
    });
  }
}
