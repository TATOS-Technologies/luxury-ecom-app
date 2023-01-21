import 'package:meta_package/constants/key_value_constants.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

Future showConfirmationDialog(BuildContext context) {
  return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          backgroundColor: backGroundColor,
          contentWidget: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      LanguageConstants.areYouSureToLogOut.tr,
                      style: AppStyle.textStyleUtils500_16(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonButton(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        buttonType: ButtonType.elevatedButton,
                        onPressed: () async {
                          await LocalStore.removePrefValue(
                            kStorageConstAuthToken,
                          );
                          await LocalStore.removePrefValue(
                            localStore.customerToken,
                          );
                          await LocalStore.removePrefValue(
                            kStorageConstUserDetail,
                          );
                          localStore.customerToken = "";
                          LocalStore().checkGuest();
                          Get.deleteAll();
                          Get.offAllNamed<dynamic>(
                            RoutesConstants.logoutSuccess,
                          );
                        },
                        elevation: 0.0,
                        color: appColorButton,
                        borderRadius: 20.0,
                        child: CommonTextPoppins(
                          LanguageConstants.yes.tr,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CommonButton(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        buttonType: ButtonType.elevatedButton,
                        onPressed: () async {
                          Get.back<dynamic>();
                        },
                        elevation: 0.0,
                        color: appColorButton,
                        borderRadius: 20.0,
                        child: CommonTextPoppins(
                          LanguageConstants.no.tr,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        );
      });
}
