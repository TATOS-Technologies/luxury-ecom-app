import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:brandslabels/app/controller/my_coupons_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/colors.dart';
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
        appBar: commonAppbar(
          title: LanguageConstants.myCouponsText.tr,
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: borderBlue,
                  // size: 50.0,
                ),
              )
            : Container(
              margin: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderGrey,
                      width: 2,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                          color: blueTileColor),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              LanguageConstants.couponId.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils700(),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              LanguageConstants.couponName.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils700(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              LanguageConstants.expireAt.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils700(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: borderGrey,
                    ),
                    const SizedBox(height: 14.0),
                    Expanded(
                      child: ((controller.couponCode.value.items?.length ??
                                  0) ==
                              0)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LanguageConstants.noCouponsFound.tr,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textStyleUtils500(),
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount:
                                  (controller.couponCode.value.items?.length ??
                                      0),
                              itemBuilder: (context, index) {
                                final CouponItems couponItem =
                                    controller.couponCode.value.items![index];
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            couponItem.couponId?.toString() ??
                                                '-',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            couponItem.code?.toString() ?? '-',
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            couponItem.expirationDate == null &&
                                                    (couponItem.expirationDate
                                                            ?.isEmpty ??
                                                        true)
                                                ? '-'
                                                : DateFormat(
                                                        'dd MMM yyyy HH:mm:ss')
                                                    .format(
                                                    DateTime.parse(couponItem
                                                        .expirationDate!),
                                                  ),
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
