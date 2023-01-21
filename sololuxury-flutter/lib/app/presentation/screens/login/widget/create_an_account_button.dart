import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class CreateAnAccountButton extends StatelessWidget {
  const CreateAnAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          // registrationCtr.postRegistrationDetails();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstants.createAccountText.tr,
          style: AppStyle.textStyleUtils600(size: 13.5),
        ),
      ),
    );
  }
}
