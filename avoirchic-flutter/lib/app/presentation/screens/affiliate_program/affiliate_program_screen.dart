import 'package:avoirchic/app/controller/affiliate_program_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/behaviour.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/affiliate_person_form.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/apply_for_widget.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/expect_for_widget.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/looking_for_widget.dart';
import 'package:avoirchic/app/presentation/screens/affiliate_program/widgets/promote_for_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  const AffiliateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.affiliateText.tr,
          style: AppTextStyle.textStyleUtils500_16(),
        ),
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: GetBuilder<AffiliateProgramController>(
                        id: "Affi",
                        builder: (controller) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 10,
                                ),
                                const LookingForWidget(),
                                const ExpectForWidget(),
                                const PromoteForWidget(),
                                const ApplyForWidget(),
                                const AffiliatePersonForm(),
                              ],
                            )),
                  ),
                ),
              ],
            ),
          ),
          //appBarWidget(controller),
        ],
      ),
    );
  }
}
