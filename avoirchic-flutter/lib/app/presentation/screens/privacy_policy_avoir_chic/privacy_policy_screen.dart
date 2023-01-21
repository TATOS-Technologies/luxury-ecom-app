import 'package:avoirchic/app/controller/privacy_policy_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/screens/privacy_policy_avoir_chic/widgets/expand_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        body: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Text(
                  LanguageConstants.privacyPolicyText.tr,
                ),
                elevation: 0,
              ),
              key: controller.scaffoldKey2.value,
              backgroundColor: Colors.transparent,
              body: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff367587),
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
                              // commonAppbar(
                              //   appBarColor: Colors.transparent,
                              // ),
                              const SizedBox(
                                height: 20,
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              if (controller.privacyPolicy != null &&
                                  controller
                                          .privacyPolicy?.cmsText?.isNotEmpty ==
                                      true)
                                Expanded(
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: controller
                                            .privacyPolicy?.cmsText?.length ??
                                        0,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final getList = controller
                                          .privacyPolicy?.cmsText?[index];
                                      return ExpandDetailWidget(
                                          text: getList?.title ?? '',
                                          subText: getList?.description ?? '',
                                          value: index + 1);
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
