import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

void showAllCouponsList(CartController controller) {
  showDialog<dynamic>(
    context: Get.context!,
    builder: (context) {
      return CommonAlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // titlePadding: EdgeInsets.zero,
        backgroundColor: homeBackground,
        radius: 30,
        contentWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 22,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  LanguageConstants.allCouponsList.tr,
                  style: AppTextStyle.textStyleUtils400(color: appColor),
                ),
              ),
              SizedBox(
                height: 400,
                width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.couponCode.value.items?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    CouponItems? couponItems =
                        controller.couponCode.value.items?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          controller.promoCodeController.text =
                              controller.couponCode.value.items?[index].code ??
                                  "";
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SizedBox(height: 4,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: CommonTextPoppins(
                                  LanguageConstants.coupons.tr,
                                  style: AppTextStyle.textStyleUtils500(
                                    size: 10,
                                  ).copyWith(),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: CommonTextPoppins(
                                  couponItems?.code ?? '',
                                  style: AppTextStyle.textStyleUtils500(
                                    size: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLine: 2,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
