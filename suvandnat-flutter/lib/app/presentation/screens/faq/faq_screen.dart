import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/faq/faq_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/faq/widgets/pageview.dart';

class FaqScreen extends GetView<FaqController> {
  FaqScreen({Key? key}) : super(key: key);

  final FaqController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonBacground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: commonAppbar(title: LanguageConstants.faqText.tr),
          body: controller.isLoadding.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xff973133),
                  ),
                )
              : const PageviewWidget(),
        ),
      ),
    );
  }
}


