import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/my_account/my_account_information_controller.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'widgets/contact_information_widget.dart';
import 'widgets/default_billing_design.dart';
import 'widgets/default_shipping_design.dart';
import 'widgets/news_letters_design.dart';

class MyAccountInformationScreen
    extends GetView<MyAccountInformationController> {
  @override
  final MyAccountInformationController controller = Get.find();
  MyAccountInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(title: LanguageConstants.accountInformationText.tr),
      backgroundColor: whiteColor,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: blackColor,
              ))
            : SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const ContactInformationWidget(),
                      SizedBox(
                        height: 20.w,
                      ),
                      const NewsLettersDesign(),
                      SizedBox(
                        height: 20.w,
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         LanguageConstants.addressBookText.tr,
                      //         style: AppTextStyle.textStyleUtils600(size: 20.0),
                      //       ),
                      //       InkWell(
                      //         onTap: () {
                      //           Get.toNamed(RoutesConstants.myAddress);
                      //         },
                      //         child: Text(
                      //           LanguageConstants.manageAddresses.tr,
                      //           style: AppTextStyle.textStyleUtilsUnderLine14(),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      DefaultShippingDesign(),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultBillingDesign(),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
