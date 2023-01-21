import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:avoirchic/app/presentation/screens/special_request/widgets/special_common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../controller/special_request_controller.dart';
import '../../../theme/colors.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: appBGColor,
            child: SizedBox(
              height: Get.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.0),
                  child: Column(
                    children: [
                      commonAppbar(
                          title: controller.getHeader(),
                          appBarColor: Colors.transparent),
                      const SizedBox(
                        height: 30,
                      ),
                      const NameTextField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const LastNameField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const EmailField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const PhoneNumberField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const BrandNameField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const StyleField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const KeywordField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const ImageUrlField(),
                      SizedBox(
                        height: 17.h,
                      ),
                      const RemarkField(),
                      SizedBox(
                        height: 30.h,
                      ),
                      const SubmitAccountButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: avoirChickTheme,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
