// ignore_for_file: must_be_immutable
import 'package:brandslabels/app/controller/privacy_policy_controller.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  @override
  PrivacyPolicyController controller = Get.find<PrivacyPolicyController>();

  PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        appBar: commonAppbar(title: LanguageConstants.privacyPolicyText.tr),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Color(0xff000080),
                ),
              )
            : controller.nodata.value
                ? Center(child: Text(controller.messageData.value))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LanguageConstants.policyHomeText.tr,
                              style: AppTextStyle.textStyleUtils400_16(color: darkBlue),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: darkBlue,
                              size: 16,
                            ),
                            Text(
                              LanguageConstants.policyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          LanguageConstants.policyHeadingText.tr,
                          style: AppTextStyle.textStyleUtils400(
                            color: darkBlue,
                            size: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.privacyPolicy?.cmsText?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              CmsText? getList = controller.privacyPolicy?.cmsText?[index];
                              return expandDetailWidget(getList?.title ?? '', getList?.description ?? '', index + 1);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget expandDetailWidget(String text, String subText, int value) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.index.value == value) {
            controller.index.value = 0;
          } else {
            controller.index.value = value;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                  ),
                  controller.index.value == value
                      ? const Icon(Icons.remove, color: Colors.black)
                      : const Icon(Icons.add, color: Colors.black),
                ],
              ),
              Visibility(
                visible: controller.index.value == value ? true : false,
                child: Html(
                  data: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
