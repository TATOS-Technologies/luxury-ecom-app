import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veralusso/app/controller/country/country_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_poppins.dart';
import 'package:veralusso/app/presentation/screens/country/widgets/dialog_content.dart';

class CountryScreen extends GetView<CountryController> {
  @override
  final CountryController controller = Get.find();
  CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          appBar: commonAppbar(
              title: LanguageConstants.changeLanguageAndCurrency.tr),
          backgroundColor: Colors.white,
          body: SizedBox(
            width: Get.width,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.storeWebsitesList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              await controller.setLanguageAndCurrency(
                                  controller.storeWebsitesList[index], false);
                              showDialog(
                                context: Get.context!,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    insetPadding: const EdgeInsets.all(10),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      child: DialogContent(
                                        controller.storeWebsitesList[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: CommonTextPoppins(
                                controller.storeWebsitesList[index].name ?? "",
                                fontSize: 18.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
