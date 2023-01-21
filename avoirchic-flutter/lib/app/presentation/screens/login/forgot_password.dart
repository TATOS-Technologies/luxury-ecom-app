import 'package:avoirchic/app/controller/forget_password_controller.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/elevated_button.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/forgot_email_field.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgetPasswordMenuController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
          appBar: commonAppbar(title: LanguageConstants.forgotYourPasswordText.tr,),
          backgroundColor: Colors.white,
          body: Obx(
            () => SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  key: controller.formKey.value,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                       
                        SizedBox(
                          width: width * 0.8,
                          child: Text(LanguageConstants.forgetPasswordContain.tr,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textStyleUtils400(size: 14.sp)),
                        ),
                        Container(
                          // height: 40.0,
                          margin:  EdgeInsets.only(
                              top: 20.0, bottom: 8.0, left:24.w, right: 24.w),
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderGrey, width: 2),
                          ),
                          child: const ForgotemailField(),
                        ),
                        SizedBox(height: 20.w,),
                        const ElevatedButtonWidget(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        // TextButton.icon(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.arrow_back_ios_outlined,
                        //     size: 16,
                        //     color: Colors.black,
                        //   ),
                        //   label: Text(
                        //     LanguageConstants.backToLogin.tr,
                        //     style: AppTextStyle.textStyleUtils400(),
                        //   ),
                        //   style: TextButton.styleFrom(
                        //     minimumSize: Size.zero,
                        //     padding: EdgeInsets.zero,
                        //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(0xff367587),
                    // size: 50.0,
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
