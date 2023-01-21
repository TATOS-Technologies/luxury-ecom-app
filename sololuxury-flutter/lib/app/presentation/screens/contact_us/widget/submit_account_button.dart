import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class SubmitAccountButton extends GetView<ContactUsController> {
  const SubmitAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 327.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: appColorPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          controller.contactUsPost(context);
        },
        child: CommonTextPoppins(
          LanguageConstants.submitText.tr,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
