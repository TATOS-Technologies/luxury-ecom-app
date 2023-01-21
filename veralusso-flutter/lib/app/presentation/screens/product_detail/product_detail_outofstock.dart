import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/product_detail/product_detail_controller.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class OutOfStock extends GetView<ProductDetailController> {
  @override
  final ProductDetailController controller = Get.find();
  OutOfStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isScreenLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                ),
              )
            : Stack(
                children: [
                  Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.thankYou.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine20(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: InkWell(
                          onTap: () async {
                            await controller.notifyOnClick();
                          },
                          child: Text.rich(
                            TextSpan(
                                text: LanguageConstants
                                    .notifyMeWhenThisProductIsInStock.tr,
                                style: AppTextStyle.textStyleUtils400(),
                                children: <InlineSpan>[
                                  const TextSpan(text: "  "),
                                  TextSpan(
                                    text: LanguageConstants.myTicket.tr,
                                    style: AppTextStyle.textStyleUtilsUnderLine14(),
                                  )
                                ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            LanguageConstants.continueShopping.tr,
                            style: AppTextStyle.textStyleUtilsUnderLine14(),
                          )),
                    ],
                  ),
                ],
              );
      }),
    );
  }
}
