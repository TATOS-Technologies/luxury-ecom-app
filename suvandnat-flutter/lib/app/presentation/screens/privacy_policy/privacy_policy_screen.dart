import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/privacy_policy/privacy_policy_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/privacy_policy/widgets/expand_detail_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  PrivacyPolicyScreen({Key? key}) : super(key: key);

  final PrivacyPolicyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonBacground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: controller.scaffoldKey.value,
          appBar: commonAppbar(title: LanguageConstants.privacyPolicyText.tr),
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xFF973133),
                  ),
                )
              : controller.nodata.value
                  ? Center(
                      child: Text(
                        controller.messageData.value,
                        style: AppTextStyle.textStyleUtils400(),
                      ),
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
                                style: AppTextStyle.textStyleUtils400(
                                    color: const Color(0xFF767676), size: 18),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                // color: darkBlue,
                                size: 18,
                              ),
                              Text(
                                LanguageConstants.policyText.tr,
                                style: AppTextStyle.textStyleUtils400(
                                    size: 18, color: const Color(0xFF767676)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            LanguageConstants.policyHeadingText.tr,
                            style: AppTextStyle.textStyleUtils300(size: 20),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          if (controller.privacyPolicy != null &&
                              controller.privacyPolicy?.cmsText?.isNotEmpty ==
                                  true)
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount:
                                    controller.privacyPolicy!.cmsText!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final getList =
                                      controller.privacyPolicy!.cmsText![index];
                                  return ExpandDetailWidget(getList.title!,
                                      getList.description!, index + 1);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
