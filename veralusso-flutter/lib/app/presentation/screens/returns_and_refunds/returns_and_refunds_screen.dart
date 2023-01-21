// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/colors.dart';

import 'widgets/returns_page_view.dart';

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: commonAppbar(title: LanguageConstants.returnsRefundsText.tr),
        body: ReturnsPageView(),
     
    );
  }
}
