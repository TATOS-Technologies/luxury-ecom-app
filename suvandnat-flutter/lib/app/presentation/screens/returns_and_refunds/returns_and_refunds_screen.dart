import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/screens/returns_and_refunds/widgets/page_view.dart';

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonBacground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: commonAppbar(title: LanguageConstants.returnsRefundsText.tr),
          body: const PageViewWidget(),
        ),
      ),
    );
  }
}
