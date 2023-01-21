import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/theme/colors.dart';

class ShowSuccessDialog extends StatelessWidget {
  const ShowSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: whiteColor,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              child: Text(
                LanguageConstants.orderSuccessfullyUpdatedYouWillGetYourTicketIDshortly.tr,
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
