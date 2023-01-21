import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

class ShowSuccessDialog extends StatelessWidget {
  const ShowSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // titlePadding: EdgeInsets.zero,
      backgroundColor: const Color(0xFFF9EAE3),
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
                      color: appColor,
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
