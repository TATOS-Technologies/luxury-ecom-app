import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/order_confirmation_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';

class OrderConfirmationPage extends GetView<OrderConfirmationController> {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: commonAppbar(title: LanguageConstants.orderDetails.tr),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xff000080),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          LanguageConstants.orderConfirm.tr,
                          style: AppTextStyle.textStyleUtilsUnderLine18(
                            thickness: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getOrderID(),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400_16(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          LanguageConstants.orderContain.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400_16(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getOrderDate(),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400(size: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        listOfOrder(),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.showOrderTrackingDialogBox(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: darkBlue,
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
                            const Divider(
                              height: 1,
                              color: Colors.transparent,
                              thickness: 1,
                            ),
                            Text(
                              LanguageConstants.shippingAddressText.tr,
                              style: AppTextStyle.textStyleUtils500(
                                size: 20.0,
                              ),
                            ),
                            Text(
                              controller.getAddress(),
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            Text(
                              controller.getTelephone(),
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
                            Text(
                              controller.getBillingAddress(),
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            Text(
                              "T: ${controller.orderConfirmationModel.value.billingAddress?.telephone ?? ''}",
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
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                LanguageConstants.paymentMethod.tr,
                                style: AppTextStyle.textStyleUtils500(
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              controller.orderConfirmationModel.value.payment?.additionalInformation?.first ?? '',
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(RoutesConstants.dashboardScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: darkBlue,
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
        );
      },
    );
  }

  String getOrderID() {
    return LanguageConstants.orderIdTitle.tr + (controller.orderConfirmationModel.value.incrementId?.toString() ?? '');
  }

  String getOrderDate() {
    return LanguageConstants.orderDateTitle.tr +
        ((controller.orderConfirmationModel.value.items?[0].createdAt?.toString() ?? '').isEmpty
            ? ''
            : DateFormat.yMMMMd().format(
                DateTime.parse(
                  controller.orderConfirmationModel.value.items?[0].createdAt?.toString() ?? '',
                ),
              ));
  }

  Widget listOfOrder() {
    return ListView.builder(
      itemCount: controller.orderConfirmationModel.value.items?.length ?? 0,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Items? items = controller.orderConfirmationModel.value.items?[index];
        return (controller.orderConfirmationModel.value.items?[index].parentItemId == null)
            ? Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: darkBlue,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: darkBlue,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppAsset.logo,
                                    width: 35,
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 10),
                              Image.network(
                                items?.extensionAttributess?.productImage ?? '',
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
                          items?.name.toString().capitalizeFirst ?? '',
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LanguageConstants.price.tr,
                              style: AppTextStyle.textStyleUtils400(
                                size: 15,
                                color: const Color(0xFF6D6D6D),
                              ),
                            ),
                            Text(
                              "       ${LanguageConstants.quantity.tr}",
                              style: AppTextStyle.textStyleUtils400(
                                size: 15,
                                color: const Color(0xFF6D6D6D),
                              ),
                            ),
                            Text(
                              LanguageConstants.subTotal.tr,
                              style: AppTextStyle.textStyleUtils400(
                                size: 15,
                                color: const Color(0xFF6D6D6D),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          height: 9,
                          color: Color(0xffCEAEA0),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            Text(
                              items?.qtyOrdered?.toString() ?? '',
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            Text(
                              '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${items?.price?.toString() ?? '0'}',
                              style: AppTextStyle.textStyleUtils400(),
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
    );
  }
}
