import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/controller/track_your_ticket_mail_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TraceYourTicketMail extends GetView<TrackYourTicketEmailController> {
  const TraceYourTicketMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(LanguageConstants.trackYourTicketByEmail.tr),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GetBuilder<TrackYourTicketEmailController>(
                id: "Login",
                builder: (controller) {
                  return Column(
                    children: [
                      // commonAppbar(
                      //   appBarColor: Colors.transparent,
                      // ),
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      // Text(LanguageConstants.trackYourTicketByEmail.tr,
                      //     style: AppTextStyle.textStyleUtils500_16()),
                      const SizedBox(
                        width: double.infinity,
                        height: 155,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants
                                .pleaseEnterYourEmailToTrackYourTicketByEmail
                                .tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 40.h,
                            width: 260.w,
                            child: TextFormFieldWidget(
                              controller: controller.emailController,
                              hintText: controller.emailController.text == "" &&
                                      controller.isValidation
                                  ? LanguageConstants.enterEmailAddress.tr
                                  : LanguageConstants.emailText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400(),
                              validator: (value) => null,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CommonThemeButton(
                            onTap: () {
                              controller.trackYourRequest();
                            },
                            title: LanguageConstants.signInText.tr,
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Obx(
            () => controller.isScreenLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: avoirChickTheme,
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
