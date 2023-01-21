import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:meta_package/api/models/cart/donation_modal.dart';

import '../../../../controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_widget/common_theme_button.dart';
import 'cart_dialog_content.dart';

class DonationItem extends GetView<CartController> {
  final DonationItems itemData;

  const DonationItem(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemData.imageURL == null
            ? Image.asset(
                AppAsset.donation1,
                width: 149.0,
                height: 87.0,
              )
            : Image.network(
                itemData.imageURL ?? '',
                width: 120.0,
                height: 87.0,
                fit: BoxFit.cover,
              ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                firstCapitalize(LanguageConstants.donateNowText.tr),
                style: AppTextStyle.textStyleUtils400(
                  size: 15,
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              CommonThemeButton(
                  buttonColor: whiteColor,
                  isOutLined: true,
                  textColor: primary,
                  onTap: () {
                    _showDialog(context);
                  },
                  title: LanguageConstants.iwantToDonateText.tr)
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: const CartDialogContent(),
        );
      },
    );
  }

  String firstCapitalize(String name) {
    if (name != "") {
      return name.split(" ").map((str) => str.capitalize).join(" ");
    } else {
      return "";
    }
  }
}
