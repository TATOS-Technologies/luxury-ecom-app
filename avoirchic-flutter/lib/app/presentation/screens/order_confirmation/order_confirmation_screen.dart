import 'package:avoirchic/app/core/utils/date_utils.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/app_routes.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import '../../../controller/order_confirmation_controller.dart';

class OrderConfirmationScreen extends GetView<OrderConfirmationController> {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
            ),
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: blue367587,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            LanguageConstants.orderConfirm.tr,
                            style: AppTextStyle.textStyleUtils500(size: 18.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LanguageConstants.orderIdTitle.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 15.0),
                                ),
                                TextSpan(
                                  text: controller.orderConfirmationData.value
                                          .incrementId
                                          ?.toString() ??
                                      '',
                                  style:
                                      AppTextStyle.textStyleUtils500(size: 15),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            LanguageConstants.orderContain.tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textStyleUtils400(size: 15.0),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LanguageConstants.orderDateTitle.tr,
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 18.0),
                                ),
                                TextSpan(
                                  text: getDate(),
                                  style: AppTextStyle.textStyleUtils400(
                                      size: 18.0),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      LanguageConstants.expectedShippingDate.tr,
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                                TextSpan(
                                  text: controller.orderConfirmationData.value
                                      .extensionAttributes?.estimatedShipping
                                      .toString(),
                                  style: AppTextStyle.textStyleUtils400_16(),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            itemCount: controller.orderConfirmationData.value
                                    .items?.length ??
                                0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Items? items = controller
                                  .orderConfirmationData.value.items?[index];
                              return (controller.orderConfirmationData.value
                                          .items?[index].parentItemId ==
                                      null)
                                  ? Column(
                                      children: [
                                        const SizedBox(height: 20),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: blue367587,
                                              width: 2,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 100,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: blue367587,
                                                    width: 1.4,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
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
                                                      items?.extensionAttributess
                                                              ?.productImage ??
                                                          '',
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (
                                                        BuildContext context,
                                                        Object error,
                                                        StackTrace? stackTrace,
                                                      ) {
                                                        return Image.asset(
                                                          AppAsset.logo,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                items?.name
                                                        .toString()
                                                        .capitalizeFirst ??
                                                    '',
                                                style: AppTextStyle
                                                    .textStyleUtils400(
                                                        size: 20),
                                              ),
                                              const SizedBox(height: 30),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    LanguageConstants.price.tr,
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            size: 15,
                                                            color: const Color(
                                                                0xFF6D6D6D)),
                                                  ),
                                                  Text(
                                                    "       ${LanguageConstants.quantity.tr}",
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            size: 15,
                                                            color: const Color(
                                                                0xFF6D6D6D)),
                                                  ),
                                                  Text(
                                                    LanguageConstants
                                                        .subTotal.tr,
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            size: 15,
                                                            color: const Color(
                                                                0xFF6D6D6D)),
                                                  )
                                                ],
                                              ),
                                              const Divider(
                                                height: 9,
                                                color: Color(0xffCEAEA0),
                                                thickness: 1,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                    style: AppTextStyle
                                                        .textStyleUtils400(),
                                                  ),
                                                  Text(
                                                    items?.qtyOrdered
                                                            ?.toString() ??
                                                        '',
                                                    style: AppTextStyle
                                                        .textStyleUtils400(),
                                                  ),
                                                  Text(
                                                    '${controller.orderConfirmationData.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                                                    style: AppTextStyle
                                                        .textStyleUtils400(),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox();
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.showOrderTrackingDialogBox(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: appTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.trackOrderText.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LanguageConstants.shippingAddressText.tr,
                                style: AppTextStyle.textStyleUtils500(
                                  size: 20.0,
                                ),
                              ),
                              const Divider(
                                height: 21,
                                color: blue367587,
                                thickness: 1,
                              ),
                              Text(
                                getAddress(),
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                              Text(
                                "T: ${controller.address.value.telephone}",
                                style: AppTextStyle.textStyleUtils400_16(
                                  color: grey6D6D6D,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                LanguageConstants.billingAddress.tr,
                                style: AppTextStyle.textStyleUtils500(
                                  size: 20.0,
                                ),
                              ),
                              const Divider(
                                height: 21,
                                color: blue367587,
                                thickness: 1,
                              ),
                              Text(
                                getBillingAddress(),
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                              Text(
                                "T: ${controller.orderConfirmationData.value.billingAddress?.telephone}",
                                style: AppTextStyle.textStyleUtils400_16(
                                  color: grey6D6D6D,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LanguageConstants.paymentMethod.tr,
                                style: AppTextStyle.textStyleUtils500(
                                  size: 20.0,
                                ),
                              ),
                              const Divider(
                                height: 21,
                                color: blue367587,
                                thickness: 1,
                              ),
                              Text(
                                controller.orderConfirmationData.value.payment
                                        ?.additionalInformation?.first ??
                                    '',
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              Get.offAllNamed(
                                RoutesConstants.dashboardScreen,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: appTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.continueShopping.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String getAddress() {
    return "${controller.address.value.street![0]}\n\n${controller.address.value.city}, ${controller.address.value.region}, ${controller.address.value.postcode}";
  }

  String getBillingAddress() {
    return "${controller.orderConfirmationData.value.billingAddress?.street![0]}\n\n${controller.orderConfirmationData.value.billingAddress?.city}, ${controller.orderConfirmationData.value.billingAddress?.postcode}";
  }

  String getDate() {
    DateTime? date = controller.dateVal.value.isNotEmpty
        ? DateParseUtils.dateTimeFromJsonUTC(
            controller.dateVal.value,
          )
        : null;
    return date != null ? DateFormat.yMMMMd().format(date) : '';
  }
}
