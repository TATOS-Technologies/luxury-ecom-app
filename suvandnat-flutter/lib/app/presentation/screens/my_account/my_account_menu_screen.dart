import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:livechatt/livechatt.dart';
import 'package:suvandnat/app/controller/my_account/my_account_controller.dart';
import 'package:suvandnat/app/core/const/constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:suvandnat/app/presentation/common_widget/common_text_poppins.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/presentation/screens/about_us/about_us_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_account/widgets/my_account_fields.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  MyAccountMenuPage({Key? key}) : super(key: key);

  final MyAccountController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(color: appColorPrimary),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56.h,
                      width: double.infinity,
                      color: appColorPrimary,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 24.w),
                          child: Text(
                            LanguageConstants.myAccountText.tr,
                            style: AppTextStyle.textStyleUtils600(
                                color: Colors.white, size: 20.sp),
                          ),
                        ),
                      ),
                    ),
                    localStore.customerToken.toString() != ""
                        ? Container()
                        : Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  LanguageConstants
                                      .accessYourAccountDetailsText.tr,
                                  style: AppTextStyle.textStyleUtils400(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 35.w,
                                      width: 100.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                side: const BorderSide(
                                                    color: appColorPrimary))),
                                        onPressed: () {
                                          Get.toNamed(
                                              RoutesConstants.signUpScreen);
                                        },
                                        child: CommonTextPoppins(
                                          LanguageConstants.signUpText.tr,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: appColorPrimary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SizedBox(
                                      height: 35.w,
                                      width: 100.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: appColorPrimary,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                side: const BorderSide(
                                                    color: appColorPrimary))),
                                        onPressed: () {
                                          Get.toNamed(
                                              RoutesConstants.loginScreen);
                                        },
                                        child: CommonTextPoppins(
                                          LanguageConstants
                                              .loginMyAccountText.tr,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 13.w),
                          child: Row(
                            children: [
                              Text(
                                LanguageConstants.helloText.tr,
                                style: AppTextStyle.textStyleUtils500_20(),
                              ),
                              Text(
                                controller.accountDetail?.value.firstname ?? '',
                                style: AppTextStyle.textStyleUtils600_20(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, bottom: 13.w),
                          child: Text(
                            controller.accountDetail?.value.email ?? '',
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                        ),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () async {
                                  Get.toNamed(RoutesConstants.myOrderScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.myOrderText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.wishlistScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.myWishlistText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myAddressScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.addressBookText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      RoutesConstants.myAccountScreenScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.accountInformationText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myTickets);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.myTicketsText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesConstants.myOrderScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.trackOrderText.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? GestureDetector(
                                onTap: () async {
                                  await Get.toNamed(
                                      RoutesConstants.countryScreen);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    controller.countryCurrency.value,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              )
                            : Container(),
                        localStore.customerToken.toString() != ""
                            ? const Divider(
                                color: Colors.transparent,
                              )
                            : Container(),
                        Container(
                          height: 44.h,
                          color: appTileColor10OP.withOpacity(.10),
                          padding: EdgeInsets.only(left: 24.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.companyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                RoutesConstants.returnsAndRefundsScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.returnsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.referFriendsScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.referFriendMyAccountText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.careersText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.charityScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.helpTheNeedyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.secureShoppingText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.shippingAddress.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 44.h,
                          color: appTileColor10OP.withOpacity(.10),
                          padding: EdgeInsets.only(left: 24.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.socialText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                RoutesConstants.influencerRegistrationScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.influencerRegistrationText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.affiliateProgramScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.affiliateText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.productListScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.advancedSearchText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 44.h,
                          color: appTileColor10OP.withOpacity(.10),
                          padding: EdgeInsets.only(left: 24.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LanguageConstants.aboutText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const AboutUsScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.aboutUsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.termsConditionScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.termsConditionsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.privacyPolicyScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.privacyPolicyText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.contactUsScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.contactUsText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesConstants.faqScreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.faqMyAccountText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            showTitleDialog1(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: Text(
                              LanguageConstants.liveChatText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                        ),
                        localStore.customerToken.toString() == ""
                            ? Container()
                            : const Divider(
                                color: Colors.transparent,
                              ),
                        localStore.customerToken.toString() == ""
                            ? Container()
                            : GestureDetector(
                                onTap: () async {
                                  showConfirmationDialog(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 10.w),
                                  child: Text(
                                    LanguageConstants.logOutTextavoirchic.tr,
                                    style: AppTextStyle.textStyleUtils400_16(),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 120.h,
                        )
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
            backgroundColor: backGroundColor,
            insetPadding: const EdgeInsets.all(0),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.areYouSureToLogOut.tr,
                          style: AppTextStyle.textStyleUtils400_16(),
                        ),
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
                              Get.offAllNamed(
                                RoutesConstants.logoutSuccess,
                              );
                            },
                            title: LanguageConstants.yes.tr,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          CommonThemeButton(
                            onTap: () async {
                              Get.back();
                            },
                            title: LanguageConstants.no.tr,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future showTitleDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: backGroundColor,
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                GetBuilder<MyAccountController>(
                  id: "MyAccount",
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 70,
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    LanguageConstants.welcometoChatText.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppConstants.fontPoppins,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    LanguageConstants.fillTheFormText.tr,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppConstants.fontPoppins,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Column(
                              children: const [
                                NameTextField(),
                                SizedBox(
                                  height: 10,
                                ),
                                EmailTextField(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 10.w),
                            child: CommonThemeButton(
                              onTap: () {
                                controller.isValidation = true;
                                controller.update(["MyAccount"]);
                                if (controller.validation()) {
                                  if (controller.emailController.text != "" &&
                                      controller.firstNameController.text !=
                                          "") {
                                    Livechat.beginChat(
                                      AppConstants.licenceId,
                                      '1',
                                      controller.firstNameController.text
                                          .trim(),
                                      controller.emailController.text.trim(),
                                    );
                                  }
                                }
                              },
                              title: LanguageConstants.startChatText.tr,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
