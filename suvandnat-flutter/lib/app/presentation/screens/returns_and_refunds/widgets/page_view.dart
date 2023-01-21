import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import '../../faq/widgets/expansion_til.dart';
import 'bullet_list.dart';
import 'contain.dart';
import 'list_tile_utilities.dart';

class PageViewWidget extends GetView<ReturnsAndRefundsController> {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: controller.isSelected1.value == true ||
                        controller.isSelected2.value == true ||
                        controller.isSelected3.value == true ||
                        controller.isSelected4.value == true ||
                        controller.isSelected5.value == true
                    ? 0
                    : MediaQuery.of(context).size.height / 5,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getReturnsList.length,
                // itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  debugPrint(
                      "DATADATA ========${controller.getReturnsList[index].title.toString()}");
                  return ExpansionTil(
                    verticalVisualDensity: -1,
                    iconColor: blackColor,
                    contentPadding: const EdgeInsets.only(bottom: 20),
                    title: Text(
                      controller.getReturnsList[index].title.toString(),
                      style: AppTextStyle.textStyleUtils400_16(),
                    ),
                    isIcon: controller.getReturnsList.isEmpty ? true : false,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Html(
                          data: controller.getReturnsList[index].description
                              .toString(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ListTileUtilities(
                title: LanguageConstants.returnPolicyTitle.tr,
                onTap: () {
                  controller.isSelected1.value = !controller.isSelected1.value;
                },
                isSelected: controller.isSelected1.isTrue,
              ),
              SizedBox(
                height: controller.isSelected1.isTrue ? 20 : 0,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain1.tr,
                isSelected: controller.isSelected1.isTrue,
              ),
              BulletList(
                isSelected: controller.isSelected1.isTrue,
                strings: [
                  LanguageConstants.returnPolicyContain2.tr,
                  LanguageConstants.returnPolicyContain3.tr,
                  LanguageConstants.returnPolicyContain4.tr,
                  LanguageConstants.returnPolicyContain5.tr,
                  LanguageConstants.returnPolicyContain6.tr,
                  LanguageConstants.returnPolicyContain7.tr,
                  LanguageConstants.returnPolicyContain8.tr,
                  LanguageConstants.returnPolicyContain9.tr,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain10.tr,
                isSelected: controller.isSelected1.isTrue,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain11.tr,
                isSelected: controller.isSelected1.isTrue,
              ),
              SizedBox(
                height: controller.isSelected1.isTrue ? 10 : 0,
              ),
              ListTileUtilities(
                title: LanguageConstants.returnProcessTitle.tr,
                onTap: () {
                  controller.isSelected2.value = !controller.isSelected2.value;
                },
                isSelected: controller.isSelected2.isTrue,
              ),
              SizedBox(
                height: controller.isSelected2.isTrue ? 20 : 0,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain1.tr,
                isSelected: controller.isSelected2.isTrue,
              ),
              BulletList(
                isSelected: controller.isSelected2.isTrue,
                strings: [
                  LanguageConstants.returnPolicyContain2.tr,
                  LanguageConstants.returnPolicyContain3.tr,
                  LanguageConstants.returnPolicyContain4.tr,
                  LanguageConstants.returnPolicyContain5.tr,
                  LanguageConstants.returnPolicyContain6.tr,
                  LanguageConstants.returnPolicyContain7.tr,
                  LanguageConstants.returnPolicyContain8.tr,
                  LanguageConstants.returnPolicyContain9.tr,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain10.tr,
                isSelected: controller.isSelected2.isTrue,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain11.tr,
                isSelected: controller.isSelected2.isTrue,
              ),
              SizedBox(
                height: controller.isSelected2.isTrue ? 10 : 0,
              ),
              ListTileUtilities(
                title: LanguageConstants.refundTitle.tr,
                onTap: () {
                  controller.isSelected3.value = !controller.isSelected3.value;
                },
                isSelected: controller.isSelected3.isTrue,
              ),
              SizedBox(
                height: controller.isSelected3.isTrue ? 20 : 0,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain1.tr,
                isSelected: controller.isSelected3.isTrue,
              ),
              BulletList(
                isSelected: controller.isSelected3.isTrue,
                strings: [
                  LanguageConstants.returnPolicyContain2.tr,
                  LanguageConstants.returnPolicyContain3.tr,
                  LanguageConstants.returnPolicyContain4.tr,
                  LanguageConstants.returnPolicyContain5.tr,
                  LanguageConstants.returnPolicyContain6.tr,
                  LanguageConstants.returnPolicyContain7.tr,
                  LanguageConstants.returnPolicyContain8.tr,
                  LanguageConstants.returnPolicyContain9.tr,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain10.tr,
                isSelected: controller.isSelected3.isTrue,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain11.tr,
                isSelected: controller.isSelected3.isTrue,
              ),
              SizedBox(
                height: controller.isSelected3.isTrue ? 10 : 0,
              ),
              ListTileUtilities(
                title: LanguageConstants.customisedTitle.tr,
                onTap: () {
                  controller.isSelected4.value = !controller.isSelected4.value;
                },
                isSelected: controller.isSelected4.isTrue,
              ),
              SizedBox(
                height: controller.isSelected4.isTrue ? 20 : 0,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain1.tr,
                isSelected: controller.isSelected4.isTrue,
              ),
              BulletList(
                isSelected: controller.isSelected4.isTrue,
                strings: [
                  LanguageConstants.returnPolicyContain2.tr,
                  LanguageConstants.returnPolicyContain3.tr,
                  LanguageConstants.returnPolicyContain4.tr,
                  LanguageConstants.returnPolicyContain5.tr,
                  LanguageConstants.returnPolicyContain6.tr,
                  LanguageConstants.returnPolicyContain7.tr,
                  LanguageConstants.returnPolicyContain8.tr,
                  LanguageConstants.returnPolicyContain9.tr,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain10.tr,
                isSelected: controller.isSelected4.isTrue,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain11.tr,
                isSelected: controller.isSelected4.isTrue,
              ),
              SizedBox(
                height: controller.isSelected4.isTrue ? 10 : 0,
              ),
              ListTileUtilities(
                title: LanguageConstants.howToReturnTitle.tr,
                onTap: () {
                  controller.isSelected5.value = !controller.isSelected5.value;
                },
                isSelected: controller.isSelected5.isTrue,
              ),
              SizedBox(
                height: controller.isSelected5.isTrue ? 20 : 0,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain1.tr,
                isSelected: controller.isSelected5.isTrue,
              ),
              BulletList(
                isSelected: controller.isSelected5.isTrue,
                strings: [
                  LanguageConstants.returnPolicyContain2.tr,
                  LanguageConstants.returnPolicyContain3.tr,
                  LanguageConstants.returnPolicyContain4.tr,
                  LanguageConstants.returnPolicyContain5.tr,
                  LanguageConstants.returnPolicyContain6.tr,
                  LanguageConstants.returnPolicyContain7.tr,
                  LanguageConstants.returnPolicyContain8.tr,
                  LanguageConstants.returnPolicyContain9.tr,
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain10.tr,
                isSelected: controller.isSelected5.isTrue,
              ),
              Contain(
                contain: LanguageConstants.returnPolicyContain11.tr,
                isSelected: controller.isSelected5.isTrue,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
