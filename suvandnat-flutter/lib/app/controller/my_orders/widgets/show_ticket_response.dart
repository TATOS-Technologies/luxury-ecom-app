import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:meta_package/translations/translations.dart';

class ShowTicketResponse extends StatelessWidget {
  const ShowTicketResponse({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: backGroundColor,
      radius: 30,
      contentWidget: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              message.isEmpty ? LanguageConstants.someThingWentWrongPleaseTryAgainLater.tr : message,
              style: const TextStyle(fontFamily: AppConstants.fontPoppins),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: appColorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: HeadlineBodyOneBaseWidget(
                      title: LanguageConstants.cancelText.tr,
                      titleColor: Colors.white,
                      fontFamily: AppConstants.fontPoppins,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
