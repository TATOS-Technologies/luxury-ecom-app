import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';

import 'package:veralusso/app/controller/store_credit/store_credit_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import 'widgets/custom_appbar.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> addressList = [LanguageConstants.addressBook.tr];

    StoreCreditController controller = Get.find<StoreCreditController>();
    return Obx(
      () => Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
            preferredSize: AppStyle.appBarSize, child: const CustomAppbar()),
        drawer: const Drawer(),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 14.6,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: addressList
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    hint: Text(
                      LanguageConstants.myAccountText.tr,
                      style: AppTextStyle.textStyleUtils400_18(
                          color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 26,
                      color: Colors.black,
                    ),
                    onChanged: (String? value) {},
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: controller.shoopingbiling.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Colors.black,
                      ),
                    )
                  : controller.nodata.value
                      ? Center(
                          child: Text(controller.messageData.value),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.getStoreCreditList?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final storeData =
                                  controller.getStoreCreditList?[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.black26,
                                  )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                    "${LanguageConstants.date.tr} : ${storeData?.atTime}")),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    "${LanguageConstants.description.tr} :")),
                                            Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "${storeData?.summary}",
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1,
                                        width: double.infinity,
                                        color: Colors.black26,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14.0),
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
                                                Text("${storeData?.type}")
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(LanguageConstants
                                                    .balance.tr),
                                                const SizedBox(height: 10),
                                                Text("${storeData?.balance}")
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(LanguageConstants
                                                    .remarks.tr),
                                                const SizedBox(height: 10),
                                                Text("${storeData?.used}")
                                              ],
                                            )),
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
                          )),
            ),
          ],
        ),
      ),
    );
  }
}
