import 'package:avoirchic/app/controller/cart_controller.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import 'donation_item.dart';

class CartDonation extends GetView<CartController> {
  const CartDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.0,
          color: borderGrey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.w,
            child: Text(
              firstCapitalize(LanguageConstants.supportCharityText.tr),
              style: AppTextStyle.textStyleUtils600(
                size: 16.sp,
                color: primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            LanguageConstants.charityDescriptionText.tr,
            style: AppTextStyle.textStyleUtils400(
              size: 14.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.donationList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.black),
            itemBuilder: (BuildContext context, int index) {
              return DonationItem(controller.donationList[index]);
            },
          ),
        ],
      ),
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
