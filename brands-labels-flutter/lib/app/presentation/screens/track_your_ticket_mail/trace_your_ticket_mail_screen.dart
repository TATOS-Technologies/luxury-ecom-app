import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/track_your_ticket_mail_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LanguageConstants
                              .pleaseEnterYourEmailToTrackYourTicketByEmail.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400_16(),
                        ),
                        SizedBox(height: 25.h),
                        SizedBox(
                          height: 45.h,
                          width: 327.w,
                          child: TextFormFieldWidget(
                            controller: controller.emailController,
                            hintText: controller.isValid &&
                                    controller.emailController.value.text == ""
                                ? LanguageConstants.enterEmailAddress.tr
                                : LanguageConstants.emailAddress.tr,
                            hintStyle: AppTextStyle.textStyleUtils400(),
                            validator: (value) => null,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 45.h,
                          width: 327.w,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.trackYourRequest();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.submitText.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Obx(
            () => controller.isScreenLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: darkBlue,
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
