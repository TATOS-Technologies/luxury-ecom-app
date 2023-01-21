import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../controller/order_details_controller.dart';
import '../../../../core/consts/app_constants.dart';

// ignore: must_be_immutable
class OrderDetailsScreen extends GetView<OrderDetailsController> {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: "Order Detail"),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff000080),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppTextStyle.textStyleUtils400(size: 15),
                            ),
                            TextSpan(
                              text: controller.getIncrementId(),
                              style: AppTextStyle.textStyleUtilsUnderLine18(
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        LanguageConstants.orderContain.tr,
                        textAlign: TextAlign.center,
                        style: commonTextStyle(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderDateTitle.tr,
                              style: AppTextStyle.textStyleUtils400(size: 18.0),
                            ),
                            TextSpan(
                              text: controller.getCreatedDate(),
                              style: AppTextStyle.textStyleUtils400(size: 18.0),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.expectedShipmentDate.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                            TextSpan(
                              text: controller.getEstimatedShipping(),
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        itemCount:
                            controller.myOrdersDataItem?.items?.length ?? 0,
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return (controller.myOrdersDataItem?.items?[index]
                                      .parentItemId ==
                                  null)
                              ? Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: appBarPrimary,
                                      width: 3,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: darkBlue,
                                            width: 1.4,
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              controller.getProductImage(index),
                                          fit: BoxFit.fill,
                                          height: 90,
                                          width: 90,
                                          memCacheHeight: 150,
                                          memCacheWidth: 200,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller
                                            .getItemNameCapitalizeFirst(index),
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 20.0),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              LanguageConstants.price.tr
                                                  .toUpperCase(),
                                              style: AppTextStyle
                                                  .textStyleUtils400(size: 15)),
                                          Text(
                                              "       ${LanguageConstants.qtyText.tr}",
                                              style: AppTextStyle
                                                  .textStyleUtils400(size: 15)),
                                          Text(
                                              LanguageConstants.subTotal.tr
                                                  .toUpperCase(),
                                              style: AppTextStyle
                                                  .textStyleUtils400(size: 15)),
                                          Text(
                                              LanguageConstants.actionText.tr
                                                  .toUpperCase(),
                                              style: AppTextStyle
                                                  .textStyleUtils400(size: 15))
                                        ],
                                      ),
                                      const Divider(
                                        height: 9,
                                        color: appBarPrimary,
                                        thickness: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.getPrice(index),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          Text(
                                            controller.getQtyOrdered(index),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          Text(
                                            controller.getSubTotal(index),
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller
                                                  .showDialogBoxOpen(context);
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.reply,
                                                  color: appBarPrimary,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                    LanguageConstants
                                                        .returnText.tr,
                                                    style: AppTextStyle
                                                        .textStyleUtils400(
                                                            color:
                                                                appBarPrimary)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return (controller.myOrdersDataItem?.items?[index]
                                      .parentItemId ==
                                  null)
                              ? const SizedBox(height: 15)
                              : const SizedBox();
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
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
                      ),
                      addressWidget(),
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            LanguageConstants.paymentMethod.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine20(
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            controller.getPaymentMethod(),
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesConstants.dashboardScreen);
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget addressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LanguageConstants.shippingAddressText.tr,
          style: AppTextStyle.textStyleUtilsUnderLine20(
              fontWeight: FontWeight.w500),
        ),
        Text(
          controller.getShippingAssignments(),
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          LanguageConstants.billingAddress.tr,
          style: AppTextStyle.textStyleUtilsUnderLine20(
              fontWeight: FontWeight.w500),
        ),
        Text(
          "${controller.myOrdersDataItem?.billingAddress?.street![0]},\n${controller.myOrdersDataItem?.billingAddress?.city}, ${controller.myOrdersDataItem?.billingAddress?.postcode}\n${controller.myOrdersDataItem?.billingAddress?.countryId}\nT:${controller.myOrdersDataItem?.billingAddress?.telephone}",
          style: AppTextStyle.textStyleUtils400_16(),
        ),
      ],
    );
  }

  TextStyle commonTextStyle() {
    return const TextStyle(
      fontFamily: AppConstants.fontPoppins,
      color: blackColor,
      fontSize: 16,
    );
  }
}
