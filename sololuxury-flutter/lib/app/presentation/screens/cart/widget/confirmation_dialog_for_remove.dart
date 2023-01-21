import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

Future confirmationDialogForRemove(int index, BuildContext context) async {
  showDialog<dynamic>(
    context: context,
    builder: (_) {
      return GetBuilder<CartController>(builder: (controller) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          backgroundColor: const Color(0xffFBECE5),
          titleWidget: Text(
            LanguageConstants.removeProduct.tr,
            style: const TextStyle(color: appColor),
          ),
          contentWidget: Text(
            LanguageConstants.areYouSureWantToRemoveThisProductFromCart.tr,
            style: const TextStyle(color: appColor),
          ),
          actionWidgets: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appColor,
                ),
                child: Text(
                  LanguageConstants.yes.tr,
                  style: AppTextStyle.textStyleUtils500(
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Get.back<dynamic>();
                if (localStore.customerToken.toString() != "") {
                  controller.deleteCartProductContent(
                    index,
                    1,
                  );
                } else {
                  controller.deleteCartProductContent(
                    index,
                    2,
                  );
                }
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appColor,
                ),
                child: Text(
                  LanguageConstants.no.tr,
                  style: AppTextStyle.textStyleUtils500(
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Get.back<dynamic>();
              },
            ),
          ],
        );
      });
    },
  );
}
