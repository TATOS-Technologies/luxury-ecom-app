import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:brandslabels/app/controller/order_confirmation_controller.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class OrderTrackingDialog extends StatelessWidget {
  OrderTrackingDialog({
    Key? key,
    required this.orderTrackingList,
  }) : super(key: key);

  final RxList<OrderTrackingModel> orderTrackingList;
  final OrderConfirmationController orderConfirmationController = Get.find();

  bool checkStatusDate(int index) {
    return orderTrackingList[index].statusDate.toString() == "null" ||
        orderTrackingList[index].statusDate.toString() == "";
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: whiteColor,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (orderTrackingList.isEmpty)
                      ? Text(
                          LanguageConstants.noDataAvailable.tr,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(orderTrackingList.length, (index) {
                            return Stack(
                              children: [
                                (index + 1) != orderTrackingList.length
                                    ? Column(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                left: 6,
                                              ),
                                              height: 50,
                                              width: 4,
                                              color: checkStatusDate(index) ? const Color(0xff7e7a79) : darkBlue),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 6,
                                            ),
                                            height: 30,
                                            width: 4,
                                            color: checkStatusDate(index)
                                                ? const Color(0xff7e7a79)
                                                : const Color(0xff7d675c),
                                          )
                                        ],
                                      )
                                    : const SizedBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: checkStatusDate(index)
                                            ? const Color(
                                                0xff7e7a79,
                                              )
                                            : darkBlue, // Button color
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Center(
                                            child: Text(
                                              "${index + 1}",
                                              style: AppTextStyle.textStyleUtils500_12(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      // color: Colors.red,
                                      width: Get.width * 0.75,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${orderTrackingList[index].statusTitle}",
                                            style: AppTextStyle.textStyleUtils400(
                                              color: checkStatusDate(index)
                                                  ? const Color(
                                                      0xff7e7a79,
                                                    )
                                                  : darkBlue,
                                            ),
                                          ),
                                          // const SizedBox(width: 40),
                                          checkStatusDate(index)
                                              ? const Text("")
                                              : Text(
                                                  "${orderTrackingList[index].statusDate}",
                                                  style: AppTextStyle.textStyleUtils400(
                                                    color: darkBlue,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
