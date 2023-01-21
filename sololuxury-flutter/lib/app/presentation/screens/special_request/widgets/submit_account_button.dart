import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class SubmitAccountButton extends GetView<SpecialRequestController> {
  const SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
       
        child: CommonThemeButton(
          onTap: () {
            controller.contactUsPost(context);
          },
          title:LanguageConstants.submitText.tr,
           
        ),
      ),
    );
  }
}
