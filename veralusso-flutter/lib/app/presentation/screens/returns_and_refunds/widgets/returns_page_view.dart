import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:veralusso/app/presentation/screens/faq/faq_screen.dart';
import 'package:veralusso/app/theme/theme_exports.dart';

class ReturnsPageView extends GetView<ReturnsAndRefundsController> {
  @override
  final ReturnsAndRefundsController controller = Get.find();

  ReturnsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 110,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getReturnsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                debugPrint(
                    "DATADATA ========${controller.getReturnsList[index].title.toString()}");
                return ExpansionTil(
                  verticalVisualDensity: -1,
                  iconColor: blackColor,
                  contentPadding: const EdgeInsets.only(bottom: 20),
                  title: Text(
                    controller.getReturnsList[index].title.toString(),
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  isIcon: controller.getReturnsList.isEmpty ? true : false,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Html(
                        data: controller.getReturnsList[index].description
                            .toString(),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
