import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/controller/store_credit/store_credit_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _addressList = [LanguageConstants.addressBook.tr];

    StoreCreditController controller = Get.find<StoreCreditController>();
    return Obx(
      () => Scaffold(
        drawerEnableOpenDragGesture: false,
        backgroundColor: const Color(0xffd1f2ff),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffd1f2ff),
          iconTheme: const IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
            child: SvgPicture.asset(
              AppAsset.menuIcon,
              height: 50,
            ),
          ),
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Image.asset(
              AppAsset.suvandnetLogo,
              height: 60,
              fit: BoxFit.fill,
            ),
          ),
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  bottom: 18,
                ),
                child: Image.asset(
                  AppAsset.searchIcon,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  bottom: 18,
                ),
                child: Image.asset(
                  AppAsset.heartIcon,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  bottom: 18,
                ),
                child: Image.asset(
                  AppAsset.bagIcon,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
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
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: _addressList
                        .map(
                          (value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    hint: Text(
                      LanguageConstants.myAccount.tr,
                      style: AppTextStyle.textStyleUtils400(size: 18),
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
              height: 10,
            ),
            Expanded(
              child: controller.shoopingbiling.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
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
                                        height: 20,
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
                                                Text("${storeData?.amount}")
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
