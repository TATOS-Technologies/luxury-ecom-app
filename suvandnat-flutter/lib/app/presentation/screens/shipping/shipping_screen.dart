import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

import '../../../controller/shipping/shipping_controller.dart';
import '../../../theme/app_asset.dart';
import '../faq/widgets/expansion_til.dart';

class ShippingScreen extends GetView<ShippingController> {
  ShippingScreen({Key? key}) : super(key: key);

  final ShippingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: const Color(0xffd1f2ff),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffd1f2ff),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Column(
          children: [
            Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Color(0xFF973133)),
                child: Text(
                  LanguageConstants.findCheaperText.tr,
                  style: AppTextStyle.textStyleUtils400(color: Colors.white),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 0.0, top: 16, bottom: 16),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Image.asset(AppAsset.suvandnetLogo, width: 110),
                  ),
                  const SizedBox(
                    height: 30,
                    width: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 14.0),
          Text(
            LanguageConstants.shipping.tr,
            style: AppTextStyle.textStyleUtilsUnderLine18(
                    fontWeight: FontWeight.w500, thickness: 1.3)
                .copyWith(letterSpacing: 1),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(() {
            return Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
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
                                    style: AppTextStyle.textStyleUtilsUnderLine16(thickness: 1,
                                      fontWeight: FontWeight.w500),
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
