import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

class NewAddressButton extends GetView<CheckoutOrderController> {
  const NewAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 120.w,
        height: 30.w,
        child: CommonThemeButton(
          onTap: () {
            controller.showDialogAddress(context);
          },
          title: LanguageConstants.newAddressText.tr,
           
        ),
      ),
    );
  }
}
