import 'package:avoirchic/app/core/consts/key_value_constants.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/data/local_data/local_store.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:avoirchic/app/presentation/screens/about_us/about_us_screen.dart';
import 'package:avoirchic/app/presentation/screens/donation/donation_screen.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:livechatt/livechatt.dart';

import '../../../controller/my_account_controller.dart';
import '../../../core/consts/app_constants.dart';
import '../../../core/utils/app_routes.dart';
import '../../../main/main.common.dart';
import '../../../theme/colors.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  const MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBorderColor,
        iconTheme: const IconThemeData(color: appColor),
      ),
      backgroundColor: appBGColor,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: avoirChickTheme,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(localStore.customerToken.toString() != "")Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 30.w),
                      child: Row(
                        children: [
                          Text(
                            "Hey, ",
                            style: AppTextStyle.textStyleUtils600(size: 24.sp),
                          ),
                          Text(
                            controller.accountDetail?.value.firstname ?? '',
                            style: AppTextStyle.textStyleUtils600(size: 24.sp),
                          ),
                        ],
                      ),
                    ),
                    localStore.customerToken.toString() != ""
                        ? Container()
                        : Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Text(
                                    controller.accountDetail?.value.email ?? '',
                                    style: AppTextStyle.textStyleUtils600(
                                        size: 24.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  color: appTileBGColor,
                                  height: 56.h,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 24.w),
                                      child: CommonTextPoppins(
                                        LanguageConstants.myAccountText.tr,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: primary,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                CommonTextPoppins(
                                  LanguageConstants
                                      .accessYourAccountDetailsText.tr,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 15.w,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonThemeButton(
                                      textColor: primary,
                                      isOutLined: true,
                                      buttonColor: whiteColor,
                                      onTap: () {
                                        Get.toNamed(
                                            RoutesConstants.signUpScreen);
                                      },
                                      title: LanguageConstants.signUpText.tr,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    CommonThemeButton(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutesConstants.loginScreen);
                                      },
                                      title: LanguageConstants
                                          .loginMyAccountText.tr,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () async {
                              Get.toNamed(
                                RoutesConstants.myOrdersScreen,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.myOrderText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.wishlistScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.myWishlistText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RoutesConstants.addressBookScreen,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.addressBookText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                RoutesConstants.myAccountScreenScreen,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.accountInformationText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.myTicketScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.myTicketsText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.storeCreditScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.storeCreditText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.myCouponsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.myCouponsText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutesConstants.myOrdersScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.trackOrderText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.countryScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                controller.countryCurrency.value,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w),
                          height: 44.h,
                          color: appTileBGColor,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.companyText.tr,
                              style: AppTextStyle.textStyleUtils500_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.shippingReturnText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.traceYourTicketMail);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.trackYourTicketByEmail.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.referFriendScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.spreadTheWorldText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.careersText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const DonationScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.helpTheNeedyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                RoutesConstants.appSecureShoppingScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.secureShoppingText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.toNamed(
                        //         RoutesConstants.newsLetterScreen);
                        //   },
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 10.w, horizontal: 24.w),
                        //     child: Text(
                        //       LanguageConstants.improveLivesText.tr,
                        //       style: AppTextStyle.textStyleUtils400_16(),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w),
                          height: 44.h,
                          color: appTileBGColor,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.socialText.tr,
                              style: AppTextStyle.textStyleUtils500_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RoutesConstants.influencerRegistrationScreen,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.influencerRegistrationText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.affiliateProgramScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.affiliateText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.trackYourOrderScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.trackYourOrder.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 24.w),
                          height: 44.h,
                          color: appTileBGColor,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.aboutText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.termsConditionScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.termsConditionsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.privacyPolicyScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.privacyPolicyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.contactUsScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.contactUsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const AboutUsScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.aboutUsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                           Get.toNamed(RoutesConstants.faqScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.faqMyAccountText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showTitleDialog(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.w, horizontal: 24.w),
                            child: Text(
                              LanguageConstants.liveChatText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        if (localStore.customerToken.toString() != "")
                          GestureDetector(
                            onTap: () async {
                              showConfirmationDialog(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 24.w),
                              child: Text(
                                LanguageConstants.logOutText.tr,
                                style: AppTextStyle.textStyleUtils400_16(),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future showConfirmationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          backgroundColor: whiteColor,
          insetPadding: const EdgeInsets.all(10),
          contentWidget: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Padding(
                padding: EdgeInsets.all(30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LanguageConstants.areYouSureToLogOut.tr,
                      style: AppTextStyle.textStyleUtils400_16(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonThemeButton(
                            onTap: () async {
                              await LocalStore.removePrefValue(
                                  kStorageConstAuthToken);
                              await LocalStore.removePrefValue(
                                  localStore.customerToken);
                              await LocalStore.removePrefValue(
                                  kStorageConstUserDetail);
                              localStore.customerToken = "";
                              LocalStore().checkGuest();
                              Get.deleteAll();
                              Get.offAllNamed(RoutesConstants.logoutSuccess);
                            },
                            title: LanguageConstants.yes.tr),
                        const SizedBox(
                          width: 15,
                        ),
                        CommonThemeButton(
                            onTap: () {
                              Get.back();
                            },
                            title: LanguageConstants.no.tr),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future showTitleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            contentWidget: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 3.8,
              child: GetBuilder<MyAccountController>(
                id: "MyAccount",
                builder: (controller) {
                  return Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          nameTextField(controller),
                          const SizedBox(height: 7.5),
                          emailTextField(controller),
                          const SizedBox(height: 7.5),
                          CommonThemeButton(
                            onTap: () async {
                              controller.isValidation = true;
                              controller.update(["MyAccount"]);
                              if (controller.validation()) {
                                if (controller.firstNameController.text != "" &&
                                    controller.emailController.text != "") {
                                  Livechat.beginChat(
                                    AppConstants.licenceId,
                                    '1',
                                    controller.firstNameController.value.text
                                        .trim(),
                                    controller.emailController.value.text
                                        .trim(),
                                  );
                                }
                              }
                            },
                            title: LanguageConstants.startChatText.tr,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  Widget nameTextField(MyAccountController controller) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        controller: controller.firstNameController,
        validator: (value) => null,
        cursorHeight: 25,
        cursorColor: borderGrey,
        textAlign: TextAlign.center,
        decoration: getInputDecoration(
            controller.firstNameController.text == "" && controller.isValidation
                ? LanguageConstants.enterFirstName.tr
                : LanguageConstants.nameChatText.tr),
      ),
    );
  }

  Widget emailTextField(MyAccountController controller) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        controller: controller.emailController,
        validator: (value) => null,
        cursorHeight: 25,
        cursorColor: borderGrey,
        textAlign: TextAlign.center,
        decoration: getInputDecoration(
            controller.isValidation && controller.emailController.text == ""
                ? LanguageConstants.enterEmailAddress.tr
                : LanguageConstants.emailText.tr),
      ),
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyle.textStyleUtils400(),
      // contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: red),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: borderGrey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: borderGrey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: borderGrey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: borderGrey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
