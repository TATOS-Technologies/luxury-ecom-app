import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_button.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/theme/colors.dart';

class CouponRemoveDialog extends StatelessWidget {
  const CouponRemoveDialog({
    Key? key,
    required this.onTap,
    required this.textValue,
  }) : super(key: key);
  final Function() onTap;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      radius: 30,
      contentWidget: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.close,
                  size: 22,
                  color: Colors.transparent,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.close,
                      size: 22,
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                LanguageConstants.languageText.tr.trArgs([textValue]),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                  child: CommonButton(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    buttonType: ButtonType.ElevatedButton,
                    onPressed: onTap,
                    elevation: 0.0,
                    color: blackColor,
                    borderRadius: 0.0,
                    child: CommonTextPoppins(
                      LanguageConstants.okay.tr,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 40.0,
                  child: CommonButton(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    buttonType: ButtonType.ElevatedButton,
                    onPressed: () {
                      Get.back();
                    },
                    elevation: 0.0,
                    color: blackColor,
                    borderRadius: 0.0,
                    child: CommonTextPoppins(
                      LanguageConstants.cancel.tr,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
