import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/refer_friend/widget/refer_successfully.dart';

import 'widget/common_textfields.dart';
import 'widget/register_button.dart';

class ReferFriendScreen extends GetView<ReferFriendController> {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title:LanguageConstants.referFriendText.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                controller.isSuccessfully.value
                    ? const ReferSuccessfully()
                    : Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: CommonTextOpenSans(
                                LanguageConstants.referFriendSendCouponCode.tr,
                                textAlign: TextAlign.center,
                                color: Colors.black87,
                                fontSize: 14.0,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const NameTextField(),
                            const SizedBox(height: 12),
                            const EmailTextField(),
                            const SizedBox(height: 12),
                            const PhoneTextField(),
                            const SizedBox(height: 12),
                            const FriendFirstNameTextField(),
                            const SizedBox(height: 12),
                            const FriendEmailTextField(),
                            const SizedBox(height: 12),
                            const FriendPhoneTextField(),
                            const SizedBox(height: 25),
                            const RegisterButton(),
                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
                controller.isLoading.value
                    ? Center(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                          child: const SpinKitThreeBounce(
                            color: appColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
