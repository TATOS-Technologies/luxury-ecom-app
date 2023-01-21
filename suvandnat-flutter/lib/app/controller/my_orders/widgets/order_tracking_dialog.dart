import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/order_tracking/order_traking_model.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/theme/colors.dart';

class OrderTrackingDialog extends StatelessWidget {
  const OrderTrackingDialog({
    Key? key,
    required this.orderTrackingList,
  }) : super(key: key);
  final RxList<OrderTrackingModel> orderTrackingList;

  Color checkStatusDate(int index) {
    return orderTrackingList[index].statusDate.toString() == "null" ||
            orderTrackingList[index].statusDate.toString() == ""
        ? const Color(0xff7e7a79)
        : blackColor;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: backGroundColor,
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
                  Column(
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
                                      color: checkStatusDate(index),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 6,
                                      ),
                                      height: 30,
                                      width: 4,
                                      color: checkStatusDate(index + 1),
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
                                  color: checkStatusDate(index),
                                  // Button color
                                  child: SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                      style: TextStyle(
                                        color: checkStatusDate(index),
                                        fontSize: 14,
                                      ),
                                    ),
                                    // const SizedBox(width: 40),
                                    orderTrackingList[index].statusDate.toString() == "null" ||
                                            orderTrackingList[index].statusDate.toString() == ""
                                        ? const SizedBox.shrink()
                                        : Text(
                                            "${orderTrackingList[index].statusDate}",
                                            style: const TextStyle(
                                              color: blackColor,
                                              fontSize: 14,
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
