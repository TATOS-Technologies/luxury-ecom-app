import 'package:intl/intl.dart';
import 'package:meta_package/api/models/checkout_order/coupon_code_model.dart';
import 'package:solo_luxury/app/controller/my_coupons/my_coupons_controller.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';

class MyCouponsScreen extends GetView<MyCouponsController> {
  const MyCouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        appBar: commonAppbar(title: LanguageConstants.myCouponsText.tr),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                  // size: 50.0,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 14.0),
                  const SizedBox(height: 14.0),
                  Expanded(
                    child: ((controller.couponCode.value.items?.length ?? 0) ==
                            0)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const NothigToShowAnimationWidget(),
                              Text(
                                LanguageConstants.noCouponsFound.tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.textStyleUtils500(),
                              ),
                            ],
                          )
                        : ListView.builder(
                            itemCount:
                                (controller.couponCode.value.items?.length ??
                                    0),
                            itemBuilder: (context, index) {
                              CouponItems? couponItem =
                                  controller.couponCode.value.items?[index];
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
                                          couponItem?.couponId?.toString() ??
                                              '-',
                                          textAlign: TextAlign.center,
                                          style: AppStyle.textStyleUtils500(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          couponItem?.code?.toString() ?? '-',
                                          textAlign: TextAlign.center,
                                          style: AppStyle.textStyleUtils500(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          couponItem?.expirationDate == null &&
                                                  (couponItem?.expirationDate
                                                          ?.isEmpty ??
                                                      true)
                                              ? '-'
                                              : DateFormat(
                                                      'dd MMM yyyy HH:mm:ss')
                                                  .format(
                                                  DateTime.parse(couponItem
                                                          ?.expirationDate ??
                                                      ''),
                                                ),
                                          textAlign: TextAlign.center,
                                          style: AppStyle.textStyleUtils500(),
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
    );
  }
}
