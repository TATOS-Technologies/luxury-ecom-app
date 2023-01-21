import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:avoirchic/app/controller/my_coupons_controller.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyCouponsScreen extends GetView<MyCouponsController> {
  const MyCouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(LanguageConstants.myCouponsText.tr),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: avoirChickTheme,
                  // size: 50.0,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(24.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderGrey, width: 2)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.h,
                        decoration: const BoxDecoration(
                            color: blueTileColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(11),
                              topRight: Radius.circular(11),
                            )),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                LanguageConstants.couponId.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                LanguageConstants.couponName.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                LanguageConstants.expireAt.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: borderGrey,
                        thickness: 2,
                        height: 2,
                      ),
                      Expanded(
                        child: ((controller.couponCode.value.items?.length ??
                                    0) ==
                                0)
                            ? Text(LanguageConstants.noCouponsFound.tr,
                                textAlign: TextAlign.center,
                                style:
                                    AppTextStyle.textStyleUtils500(size: 14.sp))
                            : ListView.builder(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                itemCount: (controller
                                        .couponCode.value.items?.length ??
                                    0),
                                itemBuilder: (context, index) {
                                  final CouponItems couponItem =
                                      controller.couponCode.value.items![index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                couponItem.couponId
                                                        ?.toString() ??
                                                    '-',
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle
                                                    .textStyleUtils500(
                                                        size: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                  couponItem.code?.toString() ??
                                                      '-',
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .textStyleUtils500(
                                                          size: 14.sp)),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                  couponItem.expirationDate ==
                                                              null &&
                                                          (couponItem
                                                                  .expirationDate
                                                                  ?.isEmpty ??
                                                              true)
                                                      ? '-'
                                                      : DateFormat(
                                                          'dd MMM yyyy HH:mm:ss',
                                                        ).format(
                                                          DateTime.parse(
                                                            couponItem
                                                                .expirationDate!,
                                                          ),
                                                        ),
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .textStyleUtils500(
                                                          size: 14.sp)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
