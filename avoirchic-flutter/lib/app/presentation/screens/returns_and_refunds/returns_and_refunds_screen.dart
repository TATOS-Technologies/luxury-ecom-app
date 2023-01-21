import 'package:avoirchic/app/controller/returns_and_refunds_controller.dart';
import 'package:avoirchic/app/presentation/screens/returns_and_refunds/widgets/page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: const [
            PageViewWidget(),
          ],
        ),
      ),
    );
  }
}
