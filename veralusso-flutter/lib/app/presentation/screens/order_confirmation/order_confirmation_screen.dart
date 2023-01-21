import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/order_confirmation/order_confirmation_model.dart';
import 'package:veralusso/app/controller/order_confirmation/order_confirmation_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../common_widget/common_message/app_routes.dart';

class OrderConfirmationPage extends GetView<OrderConfirmationController> {
  @override
  final OrderConfirmationController controller = Get.find();

  OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Address? address = controller.extensionAttributes.value.shippingAssignments?.first.shipping?.address;

        return Scaffold(
          body: SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    Get.offAllNamed(RoutesConstants.dashboardScreen);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24.0,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: blackColor,
                        // size: 50.0,
                      ),
                    )
                  : SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          SizedBox(height: 20.w,),
                      Text(
                        LanguageConstants.orderConfirm.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils500_18(),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: LanguageConstants.orderIdTitle.tr,
                              style: AppStyle.commonTextStyle16400(),
                            ),
                            TextSpan(
                              text: controller.orderConfirmationModel.value.incrementId ?? ''.toString(),
                              style: AppStyle.commonTextStyle16500(),
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
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(12),
                                           border: Border.all( color: textFieldBoarderColor,width: 2)
                                          ),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(12),
                                                child: Container(
                                                  height: 105,
                                                  width: 100,
                                                  padding: const EdgeInsets.all(8),

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
                                                const SizedBox(height: 10),
                                                Image.network(
                                                  controller.items[index].extensionAttributess!.productImage!,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                          ),
                                          ),const SizedBox(height: 10),
                                          Text(
                                            controller.items[index].name.toString().capitalizeFirst ?? '',
                                            style: AppStyle.textStyleUtils400(),
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Price",
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              ),
                                              Text(
                                                "       ${LanguageConstants.quantity.tr}",
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              ),
                                              Text(
                                                LanguageConstants.subTotal.tr,
                                                style: AppTextStyle.textStyleUtils400(size: 12.sp),
                                              )
                                            ],
                                          ),
                                          const Divider(
                                            height: 9,
                                            thickness: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].price?.toString() ?? ''}',
                                                style: AppStyle.textStyleUtils400(
                                                            size: 12.sp
                                                ),
                                              ),
                                              Text(
                                                controller.items[index].qtyOrdered.toString(),
                                                style: AppStyle.textStyleUtils400(
                                                            size: 12.sp
                                                ),
                                              ),
                                              Text(
                                                '${controller.orderConfirmationModel.value.orderCurrencyCode ?? ''} ${controller.items[index].rowTotal?.toString() ?? ''}',
                                                style: AppStyle.textStyleUtils400(
                                                            size: 12.sp),
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
                                            vertical: 20,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.circular(12),
                                           border: Border.all( color: textFieldBoarderColor,width: 2)
                                          ),

                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                LanguageConstants.orderExpectedSDTitle.tr,
                                style: AppStyle.commonTextStyle20400(
                                  size: 13.0,
                                ),
                              ),
                              Text(
                                LanguageConstants.orderDateTitle.tr,
                                style: AppStyle.commonTextStyle20400(
                                  size: 13.0,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.extensionAttributes.value.estimatedShipping ?? '',
                                  style: AppStyle.commonTextStyle20400(size: 15.0),
                                ),
                                controller.orderConfirmationModel.value.createdAt != null
                                    ? Text(
                                        controller.getCreatedDate(),
                                        style: AppStyle.commonTextStyle20400(size: 15.0),
                                      )
                                    : const SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CommonThemeButton(
                            onTap: () {
                              showOrderTrackingDialogBox(context);
                            },
                            title:
                              LanguageConstants.trackOrderText.tr,

                          ),
                          const SizedBox(height: 45),
                          Container(
                             padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 20,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius: BorderRadius.circular(12),
                                           border: Border.all( color: textFieldBoarderColor,width: 2)
                                          ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageConstants.shippingAddressText.tr,
                                  style: AppStyle.commonTextStyle20600(
                                    color: blackColor,
                                    size: 14.sp,
                                  ),
                                ),
                                const Divider(
                                  height: 24,
                                  color: textFieldBoarderColor,
                              thickness: 1,
                            ),
                            Text(
                              controller.getAddress(address!),
                              style: AppStyle.textStyleUtils400(),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  LanguageConstants.billingAddress.tr,
                                  style:AppStyle.commonTextStyle20600(
                                    color: blackColor,
                                    size: 14.sp,
                                  ),
                                ),
                                const Divider(
                                  height: 24,
                                  color: textFieldBoarderColor,
                              thickness: 1,
                            ),
                            Text(
                              controller.getBillingAddress(),
                              style: AppStyle.textStyleUtils400(),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  LanguageConstants.paymentMethod.tr,
                                  style: AppStyle.commonTextStyle20600(
                                    color: blackColor,
                                    size: 14.sp,
                                  ),
                                ),
                                const Divider(
                                  height: 24,
                                  color: textFieldBoarderColor,
                              thickness: 1,
                            ),
                            Text(
                              controller.getPaymentValue(),
                              style: AppStyle.textStyleUtils400(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          CommonThemeButton(
                            isOutLined: true,
                            buttonColor: whiteColor,
                            textColor: blackColor,
                            onTap: () {
                              Get.offAllNamed(RoutesConstants.dashboardScreen);
                            },
                            title: LanguageConstants.continueShopping.tr,

                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  void showOrderTrackingDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            radius: 20,
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, color: Color(0xff7e7a79))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
                    child: Row(
                      children: [
                        (controller.orderTrackingList.isEmpty)
                            ? Container()
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: 6,
                                        ),
                                        height: 80,
                                        width: 4,
                                        color: controller.checkOrderTrackingList(0)
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipOval(
                                            child: Material(
                                              color: blackColor, // Button color
                                              child: SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Center(
                                                  child: Text("1",
                                                      style: AppTextStyle.textStyleUtils500_12(color: Colors.white)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.orderTrackingList[0].statusTitle}",
                                                style: AppTextStyle.textStyleUtils400(),
                                              ),
                                              const SizedBox(width: 60),
                                              controller.checkOrderTrackingList(0)
                                                  ? const Text("")
                                                  : Text(
                                                      "${controller.orderTrackingList[0].statusDate}",
                                                      style: AppTextStyle.textStyleUtils400(),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 50,
                                        width: 4,
                                        color: controller.checkOrderTrackingList(1)
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ClipOval(
                                              child: Material(
                                            color: controller.checkOrderTrackingList(1)
                                                ? const Color(0xff7e7a79)
                                                : blackColor, // Button color
                                            child: SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: Center(
                                                child: Text(
                                                  "2",
                                                  style: AppTextStyle.textStyleUtils500_12(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.orderTrackingList[1].statusTitle}",
                                                style: AppTextStyle.textStyleUtils400(
                                                    color: controller.checkOrderTrackingList(1)
                                                        ? const Color(0xff7e7a79)
                                                        : blackColor),
                                              ),
                                              const SizedBox(width: 60),
                                              controller.checkOrderTrackingList(1)
                                                  ? const Text("")
                                                  : Text(
                                                      "${controller.orderTrackingList[1].statusDate}",
                                                      style: AppTextStyle.textStyleUtils400(),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 30,
                                        width: 4,
                                        color: controller.checkOrderTrackingList(2)
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 80,
                                        width: 4,
                                        color: controller.checkOrderTrackingList(2)
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: Material(
                                              color: controller.checkOrderTrackingList(2)
                                                  ? const Color(0xff7e7a79)
                                                  : const Color(0xff7d675c),
                                              // Button color
                                              child: SizedBox(
                                                width: 18,
                                                height: 18,
                                                child: Center(
                                                  child: Text(
                                                    "3",
                                                    style: AppTextStyle.textStyleUtils500_12(color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.orderTrackingList[2].statusTitle}",
                                                style: AppTextStyle.textStyleUtils400(
                                                  color: controller.checkOrderTrackingList(2)
                                                      ? const Color(0xff7e7a79)
                                                      : blackColor,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              controller.checkOrderTrackingList(2)
                                                  ? const Text("")
                                                  : Text(
                                                      "${controller.orderTrackingList[2].statusDate}",
                                                      style: AppTextStyle.textStyleUtils400(),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 6),
                                        height: 10,
                                        width: 4,
                                        color: controller.checkOrderTrackingList(3)
                                            ? const Color(0xff7e7a79)
                                            : const Color(0xff7d675c),
                                      ),
                                      Row(
                                        children: [
                                          ClipOval(
                                              child: Material(
                                                  color: controller.checkOrderTrackingList(3)
                                                      ? const Color(0xff7e7a79)
                                                      : const Color(0xff7d675c), // Button color
                                                  child: SizedBox(
                                                    width: 18,
                                                    height: 18,
                                                    child: Center(
                                                      child: Text(
                                                        "4",
                                                        style: AppTextStyle.textStyleUtils500_12(color: Colors.white),
                                                      ),
                                                    ),
                                                  ))),
                                          const SizedBox(width: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${controller.orderTrackingList[3].statusTitle}",
                                                style: AppTextStyle.textStyleUtils400(
                                                  color: controller.checkOrderTrackingList(3)
                                                      ? const Color(0xff7e7a79)
                                                      : blackColor,
                                                ),
                                              ),
                                              const SizedBox(width: 60),
                                              controller.checkOrderTrackingList(3)
                                                  ? const Text("")
                                                  : Text(
                                                      "${controller.orderTrackingList[3].statusDate}",
                                                      style: AppTextStyle.textStyleUtils400(),
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
