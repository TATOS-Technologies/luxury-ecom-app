import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/guest_returns_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(title: LanguageConstants.trackOrderText.tr,),
      // bottomNavigationBar: ,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 20.w),
            Align(
              alignment: Alignment.centerLeft,
              child: CommonTextPoppins(
                'Guest Users',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.w),
            TextFormFieldWidget(
              controller: controller.orderIdController,
              hintText: LanguageConstants.orderIdText.tr,
            ),
            SizedBox(height: 20.w),
            TextFormFieldWidget(
              controller: controller.billingLastnameController,
              hintText: 'Billing Last Name',
            ),
            SizedBox(height: 40.w),
            Align(
                alignment: Alignment.centerLeft,
                child: CommonTextPoppins(
                  'Find Order by',
                  fontSize: 14.sp,
                )),
            SizedBox(height: 20.w),
            TextFormFieldWidget(
              controller: controller.emailController,
              hintText: LanguageConstants.email.tr,
            ),
            SizedBox(height: 20.w),
            TextFormFieldWidget(
              controller: controller.confrmEmailController,
              hintText: LanguageConstants.email.tr,
            ),
            SizedBox(height: 40.w),
            Center(
              child: CommonThemeButton(
                  onTap: () {}, title: LanguageConstants.letsGoText.tr),
            ),
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
              color: whiteColor,
              border: Border.all(color: borderGrey),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextFormField(
                      controller: null,
                      decoration: InputDecoration(
                        filled: false,
                       
                        hintText: LanguageConstants.enterEmailAddress.tr,
                        labelStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.black54),
                        errorStyle: AppTextStyle.textStyleUtils400(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
                        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
                        isDense: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: CommonThemeButton(onTap: () {
                    
                  }, title: LanguageConstants.specialSizeSubscribeText.tr),
                ),
                SizedBox(
                  height: 40.h,)
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
