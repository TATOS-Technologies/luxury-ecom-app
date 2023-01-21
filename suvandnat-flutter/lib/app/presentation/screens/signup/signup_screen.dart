// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suvandnat/app/controller/signup/signup_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:suvandnat/app/presentation/screens/signup/widgets/common_text_fields.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

import '../../../theme/app_asset.dart';

///
/// [SignUpScreen]
///
class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpController controller = Get.find();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(appBarColor: Colors.transparent),
        body: Stack(
          children: [
            GetBuilder<SignUpController>(
              id: "SignIn",
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30.w,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                    LanguageConstants.signUpText.tr,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 30.w,
                              ),
                              const EmailTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const ConfirmEmailTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const PasswordTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const ConfirmPasswordTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const FirstNameTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const LastNameTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              const DateOfBirthTextFormFields(),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(
                                height: 40,
                                child: TextFormFieldWidget(
                                  controller: controller.domTextController,
                                  focusNode: controller.domFocusNode,
                                  keyboardType: TextInputType.name,
                                  hintText: controller.isValid &&
                                          controller.domTextController.text ==
                                              ""
                                      ? LanguageConstants.dateOfMarriage.tr
                                      : LanguageConstants
                                          .marriageAnniversaryText.tr,
                                  hintStyle: AppTextStyle.textStyleUtils300_12(
                                      color: Colors.grey),
                                  onTap: () async {
                                    final DateTime? pickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                    );
                                    controller.domTextController.text =
                                        DateFormat.yMMMd().format(selectedDate);

                                    if (pickedDate != null &&
                                        pickedDate != selectedDate) {
                                      debugPrint('hello $pickedDate');
                                      selectedDate = pickedDate;
                                    }
                                  },
                                  validator: (value) {
                                    return null;
                                  },
                                  suffixIcon: Image.asset(AppAsset.calendar,
                                      cacheHeight: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Agreement(),
                              const SizedBox(
                                height: 15.0,
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      controller.checkBoxFillColor.value,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  controller.signUpUser();
                                },
                                child: HeadlineBodyOneBaseWidget(
                                  title:
                                      LanguageConstants.createAnAccountText.tr,
                                  titleColor: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Obx(
              () => controller.isSignUpApiCall.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: Color(0xFF973133),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
