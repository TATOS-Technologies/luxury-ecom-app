import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class MyAccountHeader extends StatelessWidget {
  const MyAccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.w),
        child: Text(
          LanguageConstants.myAccountText.tr,
          style: AppStyle.textStyleUtils600(
            color: appColor,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
