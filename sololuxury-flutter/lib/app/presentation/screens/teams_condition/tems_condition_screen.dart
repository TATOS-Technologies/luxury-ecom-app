import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/theme/colors.dart';
import 'package:solo_luxury/app/controller/teams_condition/tems_condition_controller.dart';

class TermAndConditionScreen extends GetView<TermAndConditionController> {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        key: controller.scaffoldKey.value,
        appBar: commonAppbar(
          title: LanguageConstants.termAndConditionHeadingText.tr,
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                  // size: 50.0,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.termsAndConditionsModel.value.content == null
                          ? Text(
                              LanguageConstants.noDataFound.tr,
                            )
                          : Center(
                              child: Html(
                                data: controller.termsAndConditionsModel.value
                                        .content ??
                                    '',
                              ),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
