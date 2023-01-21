import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class NewCustomerButton extends StatelessWidget {
  const NewCustomerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      LanguageConstants.newCustomersText.tr,
      style: AppStyle.textStyleUtils600(color: appColor, size: 15.8),
    );
  }
}
