import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class TraceYourTicketMail extends GetView<TrackYourTicketEmailController> {
  const TraceYourTicketMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(
        title: LanguageConstants.trackYourTicketByEmail.tr,
      ),
      body: GetBuilder<TrackYourTicketEmailController>(
        id: "validation",
        builder: (controller) {
          return Stack(
            children: [
              Form(
                key: controller.formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            LanguageConstants
                                .pleaseEnterYourEmailToTrackYourTicketByEmail
                                .tr,
                            textAlign: TextAlign.center,
                            style: AppStyle.textStyleUtils400(),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: 250,
                          child: TextFormFieldWidget(
                            unFillField: true,
                            isFilled: true,
                            inputFormFilledColor: backGroundColor,
                            controller: controller.emailController,
                            hintText:
                                (controller.emailController.value.text == "" &&
                                        controller.isSubmitButtonPressed)
                                    ? LanguageConstants.emailIsRequired.tr
                                    : LanguageConstants.email.tr,
                            validator: (value) => null,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonThemeButton(
                          onTap: () {
                            controller.trackYourRequest();
                          },
                          title: LanguageConstants.submitText.tr,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.isScreenLoading.value
                    ? Center(
                        child: AbsorbPointer(
                          absorbing: true,
                          child: Center(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                              child: const SpinKitThreeBounce(
                                color: appColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              )
            ],
          );
        },
      ),
    );
  }
}
