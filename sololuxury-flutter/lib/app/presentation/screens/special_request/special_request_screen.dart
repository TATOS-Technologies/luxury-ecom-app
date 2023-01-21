import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/special_request/widgets/submit_account_button.dart';

import 'widgets/common_textfields.dart';

class SpecialRequestScreen extends GetView<SpecialRequestController> {
  const SpecialRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: homeBackground,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: CommonTextPoppins(controller.getHeader(),color: blackColor,fontSize: 14.sp),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 24.w,
              ),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const NameTextField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const LastNameField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const EmailField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const PhoneNumberField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const BrandNameField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const StyleField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const KeywordField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const ImageUrlField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const RemarkField(),
                  SizedBox(
                    height: 15.w,
                  ),
                  const SubmitAccountButton()
                ],
              ),
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const SpinKitThreeBounce(
                    color: appColor,
                    // size: 50.0,
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
