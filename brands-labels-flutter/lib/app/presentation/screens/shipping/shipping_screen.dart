import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/shipping_controller.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../core/consts/app_constants.dart';
import 'package:brandslabels/app/theme/colors.dart';
import '../faq/faq_screen.dart';

class ShippingScreen extends GetView<ShippingController> {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          LanguageConstants.shipping.tr,
          style: AppTextStyle.textStyleUtils400(size: 18),
        ),
        // centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Obx(() {
            return Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xff000080),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.transparent,
                              height: 0,
                              thickness: 1.2,
                            );
                          },
                          itemCount: controller.getShippingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            // final teamsCondition = controller
                            //     .teamsConditionList[0].cmsText![index];
                            return ListTileTheme(
                              contentPadding: const EdgeInsets.all(0),
                              dense: true,
                              horizontalTitleGap: 0.0,
                              minLeadingWidth: 0,
                              child: Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTil(
                                  verticalVisualDensity: -1,
                                  title: Text(
                                    controller.getShippingList[index].title
                                        .toString(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: blackColor,
                                      decorationThickness: 1,
                                      fontFamily: AppConstants.fontPoppins,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                    ),
                                  ),
                                  isIcon: controller.getShippingList.isEmpty
                                      ? true
                                      : false,
                                  children: [
                                    Html(
                                      data: controller
                                          .getShippingList[index].description
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
