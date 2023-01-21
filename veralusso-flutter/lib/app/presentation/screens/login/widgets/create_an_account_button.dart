import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:meta_package/meta_package.dart';
import 'package:get/get.dart';

class CreateAnAccountButton extends StatelessWidget {
  const CreateAnAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      height: 41.w,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstants.createAnAccountText.tr,
          style: AppTextStyle.textStyleUtils600(
            color: Colors.white,
            size: 13.5,
          ),
        ),
      ),
    );
  }
}
