import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class TrackYourOrderScreen extends GetView<TrackYourOrderController> {
  const TrackYourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(
        title: LanguageConstants.trackYourOrder.tr,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.transparent,
                  child: const SpinKitThreeBounce(
                    color: appColor,
                  ),
                )
              : GetBuilder<TrackYourOrderController>(
                  id: "forms",
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(
                          height: Get.height / 5,
                        ),
                        localStore.isGuest
                            ? Column(
                                children: [
                                  Text(
                                    LanguageConstants
                                        .registeredCustomersText.tr,
                                    style: AppStyle.textStyleUtils500(
                                            size: 20, color: appColorButton)
                                        .copyWith(decorationColor: appColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      LanguageConstants
                                          .ifYouHaveAnAccountSignInWithYourEmailAddress
                                          .tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.textStyleUtils400(
                                              color: appColorButton)
                                          .copyWith(decorationColor: appColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: PrimaryTextButton(
                                      onPressed: () {
                                        Get.toNamed<dynamic>(
                                            RoutesConstants.loginScreen);
                                      },
                                      title: LanguageConstants.signInText.tr,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        Text(
                          LanguageConstants.guestUsers.tr,
                          style: AppStyle.textStyleUtils500(size: 20)
                              .copyWith(decorationColor: appColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            LanguageConstants
                                .pleaseEnterOrderNumberToTrackYourOrder.tr,
                            textAlign: TextAlign.center,
                            style: AppStyle.textStyleUtils400()
                                .copyWith(decorationColor: appColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: controller.formKey,
                          child: SizedBox(
                            height: 40.w,
                            width: 280.w,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              controller: controller.orderNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: appTileBGcolor,
                                  hintText: controller.orderNumberController
                                                  .value.text ==
                                              "" &&
                                          controller.isValid
                                      ? LanguageConstants
                                          .pleaseEnterOrderNumberToTrackYourOrder
                                          .tr
                                      : LanguageConstants
                                          .enteryOurOrderNumberHere.tr,
                                  hintStyle: AppStyle.textStyleUtils400(),
                                  labelStyle: AppStyle.textStyleUtils400(
                                      color: Colors.black54),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none)),
                              validator: (value) {
                                if (value == null || value == '') {
                                  return null;
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: SizedBox(
                            height: 40.h,
                            width: 180.w,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: appColorPrimary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                onPressed: () {
                                  if (controller.formKey.currentState
                                          ?.validate() ??
                                      false) {
                                    controller.getTrackYourOrder();
                                  }
                                },
                                child: CommonTextPoppins(
                                  LanguageConstants.letsGoText.tr,
                                  fontSize: 14.sp,
                                )),
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
