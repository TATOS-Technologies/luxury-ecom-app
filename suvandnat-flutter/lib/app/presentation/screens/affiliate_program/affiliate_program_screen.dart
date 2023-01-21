import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/affiliate_program/affiliate_program_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/behaviour.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/widgets/affiliate_person_form.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/widgets/apply_for_widget.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/widgets/expect_for_widget.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/widgets/looking_for_widget.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/widgets/promote_for_widget.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  AffiliateProgramScreen({Key? key}) : super(key: key);

  final AffiliateProgramController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        appBar: commonAppbar(title: LanguageConstants.affiliateProgramText.tr),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            //appBarWidget(controller),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: GetBuilder<AffiliateProgramController>(
                    id: "Affi",
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LookingForWidget(),
                          ExpectForWidget(),
                          PromoteForWidget(),
                          ApplyForWidget(),
                          AffiliatePersonForm(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            //appBarWidget(controller),
          ],
        ),
      ),
    );
  }





}
