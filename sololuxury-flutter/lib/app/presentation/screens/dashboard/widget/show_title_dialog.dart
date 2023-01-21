import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/widget/start_chat_button.dart';

import '../../../../../all_imports.dart';
import 'email_text_field.dart';
import 'name_text_field.dart';

Future showTitleDialog(BuildContext context) {
  return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<DashboardController>(builder: (controller) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: -45.0,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: appColor,
                    child: Image.asset(
                      AppAsset.account,
                      color: Colors.white,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        //height: 70,
                        margin: const EdgeInsets.only(top: 60),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(LanguageConstants.welcometoChatText.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(LanguageConstants.fillTheFormText.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: appColor,
                                    width: 1,
                                  ),
                                ),
                                child: const NameTextField()),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: appColorAccent,
                                  border: Border.all(
                                    color: appColor,
                                    width: 1,
                                  ),
                                ),
                                child: const EmailTextField()),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: StartChatButton(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      });
}
