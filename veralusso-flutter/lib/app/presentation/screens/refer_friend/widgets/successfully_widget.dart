import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_button.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';

class SuccessfullyWidget extends GetView<ReferFriendController> {
  @override
  final ReferFriendController controller = Get.find();

  SuccessfullyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextMontserrat(
                controller.responseMsg.value,
                textAlign: TextAlign.center,
                fontSize: 14.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CommonButton(
                buttonType: ButtonType.OutlinedButton,
                onPressed: () {
                  FocusScope.of(Get.context!).requestFocus(FocusNode());
                  Get.offAndToNamed(RoutesConstants.dashboardScreen);
                },
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                color: Colors.black,
                child: CommonTextMontserrat(
                  LanguageConstants.continueShopping.tr,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ));
  }
}
