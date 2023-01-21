import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/screens/checkout_order/widget/checkout_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/checkout_order_controller.dart';

class CheckOutWidget extends GetView<CheckoutOrderController> {
  const CheckOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            CommonTextPoppins(
              LanguageConstants.purchaseText.tr,
              textAlign: TextAlign.center,
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20.sp,
            ),
            const CheckOutFormWidget(),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
