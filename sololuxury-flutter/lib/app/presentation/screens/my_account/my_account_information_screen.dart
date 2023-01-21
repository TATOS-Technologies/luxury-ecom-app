import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/my_account/my_account_information_controller.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/contact_information.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/default_billing_design.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/default_shipping_design.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/news_letters_design.dart';

class MyAccountInformationScreen
    extends GetView<MyAccountInformationController> {
  const MyAccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.accountInformationText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                child: Column(
                  children: [
                    const ContactInformation(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const NewsLettersDesign(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const DefaultBillingDesign(),
                    const SizedBox(
                      height: 20,
                    ),
                    const DefaultShippingDesign(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
