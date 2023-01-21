import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';
import '../../../common_widget/common_widget/common_text_montserrat.dart';
import 'checkout_form.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.center,
            child: CommonTextMontserrat(
              LanguageConstants.purchaseText.tr,
              textAlign: TextAlign.center,
              color: Colors.black87,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const CheckoutForm(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
