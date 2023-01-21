import '../../../../../all_imports.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return TextFormFieldWidget(
        controller: controller.firstNameController,
        hintText: (controller.firstNameController.value.text == "" &&
                controller.isSubmitButtonPressed)
            ? LanguageConstants.nameIsRequired.tr
            : LanguageConstants.nameChatText.tr,
        textAlign: TextAlign.center,
        validator: (value) => null,
      );
    });
  }
}
