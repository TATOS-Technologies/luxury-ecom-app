import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/start_chat_button.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';
import 'email_text_field.dart';
import 'name_text_field.dart';

Future showTitleDialog(BuildContext context) {
  return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<MyAccountController>(
          id: "msg",
          builder: (controller) {
            return CommonAlertDialog(
              backgroundColor: homeBackground,
              insetPadding: const EdgeInsets.all(10),
              contentWidget: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        //height: 70,

                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.w,
                            ),
                            Center(
                              child: Text(
                                LanguageConstants.welcometoChatText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                LanguageConstants.fillTheFormText.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                        ),
                        child: Column(
                          children: const[
                             NameTextField(),
                             SizedBox(
                              height: 10,
                            ),
                             EmailTextField(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 20.0,
                        ),
                        child: StartChatButton(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
}
