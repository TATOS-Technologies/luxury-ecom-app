import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/shipping/shipping_controller.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import '../faq/faq_screen.dart';

class ShippingScreen extends GetView<ShippingController> {
  @override
  final ShippingController controller = Get.find();

  ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: MediaQuery.of(context).size.height / 8,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffffffff),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Container(
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
                      padding: EdgeInsets.only(left: 0.0, top: 16, bottom: 16),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Image.asset(AppAsset.veraLussoLogo, width: 110),
              ),
              const SizedBox(
                height: 30,
                width: 30,
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 14.0),
          Text(
            LanguageConstants.shipping.tr,
            style: AppTextStyle.textStyleUtilsUnderLine18(
                    fontWeight: FontWeight.w500, thickness: 1.3)
                .copyWith(
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Obx(() {
            return Expanded(
              child: controller.isLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF000000),
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
                            return ExpansionTil(
                              verticalVisualDensity: -1,
                              title: Text(
                                controller.getShippingList[index].title
                                    .toString(),
                                maxLines: 1,
                                style: AppTextStyle.textStyleUtilsUnderLine16(
                                    thickness: 1, fontWeight: FontWeight.w500),
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
