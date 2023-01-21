import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/store_credit_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: commonAppbar(
          title: LanguageConstants.storeCreditText.tr,
        ),
        drawer: const Drawer(),
        body: controller.shoopingbiling.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff000080),
                ),
              )
            : controller.nodata.value
                ? Center(
                    child: Text(controller.messageData.value),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.storeCreditLIst.length,
                            itemBuilder: (BuildContext context, int index) {
                              final storeData =
                                  controller.storeCreditLIst[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                    color: borderGrey,
                                  )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.w),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(11),
                                                  topRight: Radius.circular(11),
                                                ),
                                                color: blueTileColor
                                              ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "${LanguageConstants.date.tr} : ${storeData['Date']}",
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              flex: 2,
                                              child: Text(
                                                  "${LanguageConstants.description.tr} :"),
                                            ),
                                            Flexible(
                                              fit: FlexFit.tight,
                                              flex: 5,
                                              child: Text(
                                                "${storeData['Description']}",
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.visible,
                                              ),
                                            ),
                                          ],
                                        ),
                                          ],
                                        ),
                                      ),
                                     
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color:borderGrey,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w,),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(LanguageConstants
                                                      .amount.tr),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      "${storeData['Account']}")
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(LanguageConstants
                                                      .balance.tr),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    "${storeData['Account']}",
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(LanguageConstants
                                                      .remarks.tr),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    "${storeData['Remarks']}",
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
