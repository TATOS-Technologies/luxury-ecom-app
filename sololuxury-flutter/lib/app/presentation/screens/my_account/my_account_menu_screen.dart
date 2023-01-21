import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/show_confirmation_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/widget/show_title_dialog.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  const MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBGvolor,
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 10.w),
            child: const SizedBox(),
          ),
          iconTheme: const IconThemeData(color: appColor),
        ),
        backgroundColor: appBGvolor,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(color: appColorPrimary),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 13.w),
                        child: Row(
                          children: [
                            Text(
                              LanguageConstants.helloText.tr,
                              style: AppStyle.textStyleUtils600(
                                color: appColor,
                                size: 20.sp,
                              ),
                            ),
                            Text(
                              controller.accountDetail?.value.firstname ?? '',
                              style: AppStyle.textStyleUtils700(
                                color: appColor,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          controller.accountDetail?.value.email ?? '',
                          style: AppStyle.textStyleUtils600(color: appColor),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 13.w),
                          child: Text(
                            LanguageConstants.myAccountText.tr,
                            style: AppStyle.textStyleUtils600(
                                color: appColor, size: 20.sp),
                          ),
                        ),
                      ),
                      localStore.customerToken.toString() != ""
                          ? Container()
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 30),
                                child: Column(
                                  children: [
                                    Text(
                                      LanguageConstants
                                          .accessYourAccountDetailsText.tr,
                                      style: AppStyle.textStyleUtils400(
                                        color: appColor,
                                        size: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 15.w),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonThemeButton(
                                          isOutLined: true,
                                          buttonColor: homeBackground,
                                          textColor: primary,
                                          onTap: () {
                                            Get.toNamed<dynamic>(
                                                RoutesConstants.signUpScreen,
                                                arguments: [
                                                  0,
                                                  MyAccountDetails(),
                                                ]);
                                          },
                                          title:
                                              LanguageConstants.signUpText.tr,
                                        ),
                                        SizedBox(width: 10.w),
                                        CommonThemeButton(
                                          onTap: () {
                                            Get.toNamed<dynamic>(
                                                RoutesConstants.loginScreen);
                                          },
                                          title: LanguageConstants.loginText.tr,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.myOrderScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: CommonTextPoppins(
                                      LanguageConstants.myOrdersText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.wishlistScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.myWishlistText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.addressBookScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.addressBookText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.myAccountScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants
                                          .accountInformationText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.myTicketsScreen);
                                    // Get.to<dynamic>(() => const MyTicketScreen());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.myTicketsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.storeCreditScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.storeCreditText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.myCouponsScreen);
                                    // Get.to<dynamic>(() => const MyTicketScreen());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.myCouponsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.myOrderScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.trackOrderText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.countryScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      controller.countryCurrency.value,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColor),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // : Container(),
                          Container(
                            width: double.infinity,
                            color: appTileBGcolor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.w, bottom: 15.w, left: 25.w),
                              child: Text(
                                LanguageConstants.companyMyAccountText.tr,
                                style: AppStyle.textStyleUtils600_14(
                                    color: appColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.contactUsScreen);
                                    //Get.to<dynamic>(() => const ContactUsScreen());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.contactUsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(RoutesConstants
                                        .appSecureShoppingScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.secureShoppingText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                        RoutesConstants.guestReturnsScreen);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.trackOrderGuest.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColorButton),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.testimonialsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                          color: appColorButton),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            color: appTileBGcolor,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.w, bottom: 15.w, left: 25.w),
                              child: Text(
                                LanguageConstants.socialMyAccountText.tr,
                                style: AppStyle.textStyleUtils600_14(
                                  color: appColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.charityScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.hopeText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.affiliateProgramScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.affiliateProgramText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants
                                          .influencerRegistrationScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants
                                          .influencerRegistrationText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.exchangeText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            width: double.infinity,
                            color: appTileBGcolor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.w, bottom: 15.w, left: 25.w),
                              child: Text(
                                LanguageConstants.contactMyAccountText.tr,
                                style: AppStyle.textStyleUtils600_14(
                                    color: appColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.privacyPolicyScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.privacyPolicyText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.teamsConditionScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.termsConditionsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.shippingScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.shippingText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.traceYourTicketMail,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants
                                          .trackYourTicketByEmail.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                localStore.customerToken.toString() != ""
                                    ? GestureDetector(
                                        onTap: () {
                                          Get.toNamed<dynamic>(
                                            RoutesConstants
                                                .trackYourOrderScreen,
                                          );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          width: double.infinity,
                                          child: Text(
                                            LanguageConstants.trackYourOrder.tr,
                                            style: AppStyle.textStyleUtils500(
                                              color: appColorButton,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Container(
                            width: double.infinity,
                            color: appTileBGcolor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.w, bottom: 15.w, left: 25.w),
                              child: Text(
                                LanguageConstants.aboutText.tr,
                                style: AppStyle.textStyleUtils600_14(
                                    color: appColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to<dynamic>(
                                        () => const AboutUsScreen());
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.aboutUsMyAccountText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.referFriendScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants
                                          .referFriendMyAccountText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    // Get.toNamed<dynamic>(RoutesConstants.guestReturnsScreen);
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.returnsAndRefundsScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.returnsText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed<dynamic>(
                                      RoutesConstants.faqScreen,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.faqMyAccountText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(color: appBGvolor),
                                GestureDetector(
                                  onTap: () {
                                    showTitleDialog(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      LanguageConstants.liveChatText.tr,
                                      style: AppStyle.textStyleUtils500(
                                        color: appColorButton,
                                      ),
                                    ),
                                  ),
                                ),
                                localStore.customerToken.toString() == ""
                                    ? Container()
                                    : const Divider(color: appBGvolor),
                                localStore.customerToken.toString() == ""
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () async {
                                          showConfirmationDialog(context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          width: double.infinity,
                                          child: Text(
                                            LanguageConstants.logOutText.tr,
                                            style: AppStyle.textStyleUtils500(
                                                color: appColor),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ));
  }
}
