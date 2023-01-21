import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/screen_loading.dart';
import 'package:suvandnat/app/presentation/screens/special_request/widgets/special_common_text_field.dart';

import '../../../controller/special_request/special_request_controller.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            Get.arguments[1] == "brand"
                ? LanguageConstants.brandProductQuery.tr
                : LanguageConstants.categoryProductQuery.tr,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 24.w,
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        const NameTextField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const LastNameField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const EmailField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const PhoneNumberField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const BrandNameField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const StyleField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const KeywordField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const ImageUrlField(),
                        SizedBox(
                          height: 15.h,
                        ),
                        const RemarkField(),
                        SizedBox(
                          height: 45.h,
                        ),
                        const SubmitAccountButton(),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const ScreenLoading()
                      : const SizedBox(),
                ),
              ],
            )),
      ),
    );
  }
}
