import 'dart:developer';

import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/country_controller.dart';
import '../../../controller/my_account_controller.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import '../../../theme/colors.dart';
import '../../common_widgets/common_widget/common_text_poppins.dart';
import 'country_dialog_content.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({Key? key}) : super(key: key);

  final MyAccountController myAccountController =
      Get.find<MyAccountController>();
  final CountryController controller = Get.find<CountryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(LanguageConstants.changeLanguageAndCurrency.tr),
              elevation: 0,
            ),
            key: controller.scaffoldKey,
            backgroundColor: whiteColor,
            body: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55.0, vertical: 10),
                    child: SizedBox(
                      height: 40,
                      child: TextFormFieldWidget(
                        controller: controller.searchController,
                        keyboardType: TextInputType.name,
                        hintText: LanguageConstants.searchCountry.tr,
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: grey636363),
                        onChanged: (value) {
                          controller.countryOnChanged(value);
                        },
                        maxLength: 15,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  controller.searchCountryList.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.all(24.w),
                            itemCount: controller.searchCountryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  log("${controller.searchCountryList[index].name}",
                                      name: "Name");
                                  log("${controller.searchCountryList[index].websiteId}",
                                      name: "Id");
                                  log("${controller.searchCountryList[index].code}",
                                      name: "code");
                                  await controller.setLanguageAndCurrency(
                                    controller.searchCountryList[index],
                                    false,
                                  );
                                  showDialog(
                                    context: Get.context!,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Colors.white,
                                        insetPadding: const EdgeInsets.all(
                                          10,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.fromLTRB(
                                            20.0,
                                            15.0,
                                            20.0,
                                            15.0,
                                          ),
                                          child: DialogContent(
                                            controller.searchCountryList[index],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                  ),
                                  child: CommonTextPoppins(
                                    controller.searchCountryList[index].name ??
                                        "",
                                    fontSize: 18.0,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            LanguageConstants.noLanguageCurrencyFound.tr,
                            style: AppTextStyle.textStyleUtils600_16(
                                color: blue367587),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
