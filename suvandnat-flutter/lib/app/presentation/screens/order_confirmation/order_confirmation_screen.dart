import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suvandnat/app/controller/order_confirmation/order_confirmation_controller.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import '../../common_widget/common_appbar.dart';

class OrderConfirmationPage extends GetView<OrderConfirmationController> {
  OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  final OrderConfirmationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Address address = controller.extensionAttributes.value
                .shippingAssignments?.first.shipping?.address ??
            Address();
        return Scaffold(
          backgroundColor: appColorAccent,
          appBar: commonAppbar(title: LanguageConstants.trackOrderText.tr),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: appColor,
                    // size: 50.0,
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Text(
                        LanguageConstants.orderConfirm.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils500(size: 18),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            TextSpan(
                              text: controller.orderConfirmationModel.value
                                      .incrementId ??
                                  ''.toString(),
                              style: AppTextStyle.textStyleUtils500_16(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        itemCount: controller.items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return (controller.items[index].parentItemId == null)
                              ? Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 20,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: backGroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: blackColor.withOpacity(0.25),
                                            blurRadius: 8,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 105,
                                            width: 100,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: borderGrey,
                                                width: 1.4,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                      AppAsset.logo,
                                                      width: 35,
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Image.network(
                                                  controller
                                                      .items[index]
                                                      .extensionAttributess!
                                                      .productImage!,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            controller.items[index].name
                                                    .toString()
                                                    .capitalizeFirst ??
                                                '',
                                            style:
                                                AppTextStyle.textStyleUtils400(
                                                    size: 20),
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                LanguageConstants.price.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                  size: 15,
                                                  color: appHintColor,
                                                ),
                                              ),
                                              Text(
                                                "       ${LanguageConstants.quantity.tr}",
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                  size: 15,
                                                  color: appHintColor,
                                                ),
                                              ),
                                              Text(
                                                LanguageConstants.subTotal.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                  size: 15,
                                                  color: appHintColor,
                                                ),
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            height: 9,
                                            color: appDividerColor,
                                            thickness: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].price?.toString() ?? ''}',
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              ),
                                              Text(
                                                controller
                                                    .items[index].qtyOrdered
                                                    .toString(),
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              ),
                                              Text(
                                                '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].rowTotal?.toString() ?? ''}',
                                                style: AppTextStyle
                                                    .textStyleUtils400(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                  ],
                                )
                              : const SizedBox();
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: backGroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: blackColor.withOpacity(0.25),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    LanguageConstants.orderExpectedSDTitle.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                        size: 13),
                                  ),
                                  Text(
                                    LanguageConstants.orderDateTitle.tr,
                                    style: AppTextStyle.textStyleUtils400(
                                        size: 13),
                                  ),
                                ]),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.extensionAttributes.value
                                          .estimatedShipping ??
                                      '',
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 15),
                                ),
                                controller.orderConfirmationModel.value
                                            .createdAt !=
                                        null
                                    ? Text(
                                        DateFormat.yMMMMd().format(
                                          DateTime.parse(
                                            controller.orderConfirmationModel
                                                    .value.createdAt
                                                    ?.toString() ??
                                                '',
                                          ),
                                        ),
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 15),
                                      )
                                    : const SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: appColorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          controller.showOrderTrackingDialogBox(context);
                        },
                        child: HeadlineBodyOneBaseWidget(
                          title: LanguageConstants.trackOrderText.tr,
                          titleColor: Colors.white,
                          fontFamily: AppConstants.fontPoppins,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 45),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Divider(
                              height: 1,
                              color: Colors.transparent,
                              thickness: 1,
                            ),
                            Text(
                              LanguageConstants.shippingAddressText.tr,
                              style: AppTextStyle.textStyleUtilsUnderLine18(),
                            ),
                            Text(
                              "${address.street?[0] ?? ''}\n${address.city ?? ''}, ${address.region ?? ''}, ${address.postcode ?? ''}\nT: ${address.telephone ?? ''}",
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              LanguageConstants.billingAddress.tr,
                              style: AppTextStyle.textStyleUtilsUnderLine18(),
                            ),
                            Text(
                              "${controller.billingAddress.value.street?[0] ?? ''}\n${controller.billingAddress.value.city}, ${controller.billingAddress.value.region}, ${controller.billingAddress.value.postcode}\nT: ${controller.billingAddress.value.telephone}",
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              LanguageConstants.paymentMethod.tr,
                              style: AppTextStyle.textStyleUtilsUnderLine18(),
                            ),
                            Text(
                              controller.paymentValue.value
                                              .additionalInformation ==
                                          null ||
                                      (controller.paymentValue.value
                                              .additionalInformation?.isEmpty ??
                                          true)
                                  ? ''
                                  : controller.paymentValue.value
                                          .additionalInformation?.first ??
                                      '',
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: appColorPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          Get.offAllNamed(RoutesConstants.dashboardScreen);
                        },
                        child: HeadlineBodyOneBaseWidget(
                          title: LanguageConstants.continueShopping.tr,
                          titleColor: Colors.white,
                          fontFamily: AppConstants.fontPoppins,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
