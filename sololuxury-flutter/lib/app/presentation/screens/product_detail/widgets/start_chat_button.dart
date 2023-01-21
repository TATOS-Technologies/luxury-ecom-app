import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class StartChatButton extends GetView<ProductDetailController> {
  const StartChatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          if (controller.formKeyChat.currentState?.validate() ?? false) {
            controller.clickChatEvent(
              name: controller.firstNameControllerChat.text.trim(),
              email: controller.emailControllerChat.text.trim(),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
        ),
        child: Text(
          LanguageConstants.startChatText.tr,
          style: AppStyle.textStyleUtils400(color: Colors.white),
        ),
      ),
    );
  }
}
