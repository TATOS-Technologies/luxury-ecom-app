import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/common_widget/behaviour.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/widgets/affiliate_person_form.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/widgets/expect_for_widget.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/widgets/looking_for_widget.dart';

import 'widgets/apply_for_widget.dart';
import 'widgets/promote_for_widget.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  @override
  final AffiliateProgramController controller = Get.find();

  AffiliateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: commonAppbar(
              title: LanguageConstants.affiliateProgramTitleText.tr),
          backgroundColor: controller.backColor.value,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LookingForWidget(),
                          ExpectForWidget(),
                          PromoteForWidget(),
                          ApplyForWidget(),
                          AffiliatePersonForm(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
