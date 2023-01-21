import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class GuestReturns extends GetView<GuestReturnsController> {
  const GuestReturns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuestReturnsController());

    return Scaffold(
      key: controller.scaffoldKey.value,
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CommonTextPoppins(
          LanguageConstants.trackOrderText.tr,
          color: blackColor,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(height: 20.w),
              Align(
                alignment: Alignment.centerLeft,
                child: CommonTextPoppins(
                  LanguageConstants.guestUsers.tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.w),
              TextFormFieldWidget(
                  controller: controller.orderIdController,
                  hintText: LanguageConstants.orderIdText.tr,
                  validator: (value) {
                    if (controller.orderIdController.text.trim() == "") {
                      return '*${LanguageConstants.requiredVal.tr}';
                    } else {
                      return null;
                    }
                  }),
              SizedBox(height: 20.w),
              TextFormFieldWidget(
                controller: controller.billingLastnameController,
                hintText: LanguageConstants.billingLastName.tr,
                contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                validator: (value) => Validators.validateName(
                  value?.trim(),
                ),
              ),
              SizedBox(height: 40.w),
              Align(
                  alignment: Alignment.centerLeft,
                  child: CommonTextPoppins(
                    LanguageConstants.findOrderby.tr,
                    fontSize: 14.sp,
                  )),
              SizedBox(height: 20.w),
              TextFormFieldWidget(
                controller: controller.emailController,
                hintText: LanguageConstants.email.tr,
                validator: (value) => Validators.validateEmail(
                  value?.trim(),
                ),
              ),
              SizedBox(height: 40.w),
              Obx(() => controller.isValid.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: appColor,
                      ),
                    )
                  : Center(
                      child: CommonThemeButton(
                          onTap: () {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              controller.getGuestTrackYourOrder();
                            }
                          },
                          title: LanguageConstants.letsGoText.tr),
                    )),
              SizedBox(height: 40.w),
              Text(
                LanguageConstants.subsubcribeText.tr,
                style: AppTextStyle.textStyleUtils500(size: 14.sp),
              ),
              SizedBox(height: 20.w),
              Text(
                LanguageConstants.getAllTheLatestText.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              SizedBox(height: 40.w),
              Container(
                decoration: BoxDecoration(
                    color: appTileBGcolor,
                    borderRadius: BorderRadius.circular(12)),
                child: Form(
                  key: controller.formKey1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.subscribeEmailController,
                              decoration: InputDecoration(
                                filled: false,
                                hintText:
                                    LanguageConstants.enterEmailAddress.tr,
                                labelStyle: AppTextStyle.textStyleUtils400(
                                    color: Colors.black54),
                                errorStyle: AppTextStyle.textStyleUtils400(),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none),
                              ),
                              validator: (value) => Validators.validateEmail(
                                value?.trim(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            child: CommonThemeButton(
                                onTap: () {
                                  if (controller.formKey1.currentState
                                          ?.validate() ??
                                      false) {
                                    controller.subscribeNewsLetter(controller
                                        .subscribeEmailController.text);
                                  }
                                },
                                title: LanguageConstants
                                    .specialSizeSubscribeText.tr),
                          ),
                          SizedBox(
                            height: 40.h,
                          )
                        ],
                      ),
                      Obx(() => controller.isLoading.value
                          ? const Center(
                              child: SpinKitThreeBounce(
                                color: appColor,
                              ),
                            )
                          : const SizedBox())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
