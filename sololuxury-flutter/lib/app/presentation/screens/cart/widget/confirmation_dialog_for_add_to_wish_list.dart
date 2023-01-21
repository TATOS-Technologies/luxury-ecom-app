import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';

Future confirmationDialogForAddToWishList(int index, BuildContext context) async {
  showDialog<dynamic>(
    context: context,
    builder: (_) {
      return GetBuilder<CartController>(builder: (controller) {
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          backgroundColor: const Color(0xffFBECE5),
          titleWidget: Text(
            LanguageConstants.addToWishlist.tr,
            style: AppStyle.textStyleUtils500(color: appColor),
          ),
          contentWidget: Text(
            LanguageConstants.onceYouAddThisProductToWishlistText.tr,
            style: AppStyle.textStyleUtils400(color: appColor),
          ),
          actionWidgets: [
            CommonThemeButton(
              title:
                  LanguageConstants.ok.tr,
                 
              onTap: () {
                Get.back<dynamic>();
                controller.postAddToWishlistData(
                  index,
                );
              },
            ),
          ],
        );
      });
    },
  );
}
