import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/privacy_policy/privacy_policy_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

import 'widgets/expand_detail_widget.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  @override
  final PrivacyPolicyController controller = Get.find();

  PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        key: controller.scaffoldKey.value,
        appBar: commonAppbar(title: LanguageConstants.privacyPolicyText.tr),
        body: controller.isLoading.value
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
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LanguageConstants.policyHomeText.tr,
                              style: AppTextStyle.textStyleUtils400_16(color: const Color(0xFF222222)),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color(0xFF222222),
                            ),
                            Text(
                              LanguageConstants.policyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(color: const Color(0xFF222222)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          LanguageConstants.policyHeadingText.tr,
                          style: AppTextStyle.textStyleUtils300(size: 20),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (controller.privacyPolicy != null && controller.privacyPolicy?.cmsText?.isNotEmpty == true)
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: controller.privacyPolicy?.cmsText?.length,
                              itemBuilder: (BuildContext context, int index) {
                                final getList = controller.privacyPolicy?.cmsText?[index];
                                return ExpandDetailWidget(getList?.title ?? '', getList?.description ?? '', index + 1);
                              },
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
