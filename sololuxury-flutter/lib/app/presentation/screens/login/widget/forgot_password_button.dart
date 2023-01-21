import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.toNamed<dynamic>(RoutesConstants.forgotPasswordMenuPage);
        },
        child: Text(
          LanguageConstants.forgotYourPasswordText.tr,
          style: AppStyle.textStyleUtils500(size: 12.sp),
        ),
      ),
    );
  }
}
