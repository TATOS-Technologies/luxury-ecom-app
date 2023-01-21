import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/controller/track_your_order_controller.dart';
import 'package:avoirchic/app/main/main.common.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../core/utils/lang_directory/language_constant.dart';

class TrackYourOrderScreen extends GetView<TrackYourOrderController> {
  const TrackYourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageConstants.trackYourOrder.tr,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: appBGColor),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => controller.isLoading.value
                        ? Container(
                            width: Get.width,
                            height: Get.height,
                            color: Colors.transparent,
                            child: const SpinKitThreeBounce(
                              color: avoirChickTheme,
                              // size: 50.0,
                            ),
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              localStore.isGuest
                                  ? Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                              LanguageConstants
                                                  .ifYouHaveAnAccountSignInWithYourEmailAddresssolo
                                                  .tr,
                                              textAlign: TextAlign.center,
                                              style: AppTextStyle
                                                      .textStyleUtils400()
                                                  .copyWith(
                                                      decorationColor:
                                                          avoirChickTheme)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.toNamed(RoutesConstants
                                                    .loginScreen);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 1,
                                                backgroundColor: appTextColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: CommonTextOpenSans(
                                                LanguageConstants.signInText.tr,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13.5,
                                              ),
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  LanguageConstants
                                      .pleaseEnterOrderNumberToTrackYourOrder
                                      .tr,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textStyleUtils400()
                                      .copyWith(
                                          decorationColor: avoirChickTheme),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0),
                                child: GetBuilder<TrackYourOrderController>(
                                  id: "Track",
                                  builder: (controller) {
                                    return Form(
                                      key: controller.formKey,
                                      child: Container(
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border:
                                                Border.all(color: borderGrey)),
                                        child: TextFormField(
                                          cursorColor: avoirChickTheme,
                                          controller:
                                              controller.orderNumberController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              // contentPadding:
                                              //     const EdgeInsets.only(
                                              //         bottom: 10,
                                              //         top: 10,
                                              //         left: 10),
                                              hintText: controller
                                                          .isValidation &&
                                                      controller
                                                              .orderNumberController
                                                              .text ==
                                                          ""
                                                  ? LanguageConstants
                                                      .enterOrderNumber.tr
                                                  : LanguageConstants
                                                      .enteryOurOrderNumberHere
                                                      .tr,
                                              hintStyle: AppTextStyle
                                                  .textStyleUtils400(
                                                      color: grey636363),
                                              labelStyle: AppTextStyle
                                                  .textStyleUtils400(
                                                      color: Colors.black54),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            return null;
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                LanguageConstants.howDoIFindMyOrderReference.tr,
                                style: AppTextStyle.textStyleUtils400(),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 35.w,
                                width: 90.w,
                                child: CommonThemeButton(
                                    onTap: () {
                                      controller.isValidation = true;
                                      controller.update(["Track"]);
                                      if (controller
                                              .orderNumberController.text !=
                                          "") {
                                        controller.getTrackYourOrder();
                                      }
                                    },
                                    title: LanguageConstants.submitText.tr),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
