import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/main/main.common.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_button.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/theme/colors.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class CartCouponSuccessfullyApplied extends StatelessWidget {
  const CartCouponSuccessfullyApplied({
    Key? key,
    required this.couponCode,
    required this.savedValue,
  }) : super(key: key);
  final String couponCode;
  final String savedValue;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: const Color(0xFFF9EAE3),
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
                      color: appColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                '$couponCode ${LanguageConstants.cOUPONAPPLIEDSUCCESSFULLYYOUSAVED.tr} ${localStore.currentCurrency} $savedValue ${LanguageConstants.oNTHISORDER.tr}',
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              height: 40.0,
              child: CommonButton(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                buttonType: ButtonType.elevatedButton,
                onPressed: () {
                  Get.back<dynamic>();
                },
                elevation: 0.0,
                color: appColorButton,
                borderRadius: 0.0,
                child:  CommonTextPoppins(
                  LanguageConstants.okay.tr,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
