import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/track_your_ticket_mail_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class TraceYourTicketMail extends GetView<TrackYourTicketEmailController> {
  const TraceYourTicketMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(
        title: LanguageConstants.trackYourTicketByEmail.tr,
      ),
      body: Stack(
        children: [
          GetBuilder<TrackYourTicketEmailController>(
            id: "track",
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 24.w, vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants
                            .pleaseEnterYourEmailToTrackYourTicketByEmail.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400_16(),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 45.h,
                        child: TextFormFieldWidget(
                          controller: controller.emailController,
                          hintText: controller.isValid &&
                                  controller.emailController.value.text == ""
                              ? LanguageConstants.enterEmailAddress.tr
                              : LanguageConstants.emailAddressText.tr,
                          validator: (value) => null,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 45.h,
                        width: 325.w,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.trackYourRequest();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                            )
                          ),
                          child: Text(
                            LanguageConstants.submitText.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:  AppTextStyle.textStyleUtils400(color: whiteColor),)
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Obx(
            () => controller.isScreenLoading.value
                ? const ScreenLoading()
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
