import 'package:brandslabels/app/controller/my_account_controller.dart';
import 'package:brandslabels/app/core/consts/app_style.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/data/local_data/local_store.dart';
import 'package:brandslabels/app/main/main.common.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:livechatt/livechatt.dart';

import '../../../core/utils/app_routes.dart';
import '../about_us/about_us_screen.dart';

class MyAccountMenuPage extends GetView<MyAccountController> {
  const MyAccountMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: appColor),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: Color(
                      0xff000080,
                    ),
                  ),
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
                              "Hello, ",
                              style: AppStyle.textStyleUtils600(
                                color: primary,
                                size: 20.sp,
                              ),
                            ),
                            Text(
                              controller.accountDetail?.value.firstname ?? '',
                              style: AppStyle.textStyleUtils700(
                                color: primary,
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
                          style: AppStyle.textStyleUtils600(color: primary),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 60.h,
                        width: double.infinity,
                        color: profileTileBG,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: CommonTextPoppins(
                              LanguageConstants.myAccountText.tr,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: ButtonColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      localStore.customerToken.toString() != ""
                          ? Container()
                          : Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: Column(
                                  children: [
                                    CommonTextPoppins(
                                      LanguageConstants
                                          .accessYourAccountDetailsText.tr,
                                      fontSize: 14.sp,
                                      color: ButtonColor,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CommonThemeButton(
                                         
                                          buttonColor: whiteColor,
                                          isOutLined: true,
                                          textColor: primary,
                                          onTap: () {
                                            Get.toNamed(
                                                RoutesConstants.registerScreen);
                                          },
                                          title:
                                                LanguageConstants.signUpText.tr,
                                                
                                        ),
                                        SizedBox(
                                          width: 15.h,
                                        ),
                                        CommonThemeButton(
                                          borderRadius: 12,
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
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.myOrderScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.myOrderText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.wishlistScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.myWishlistText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        RoutesConstants.myAddressScreen,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.addressBookText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.myAccountScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants
                                            .accountInformationText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.myTicketScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.myTicketsText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.storeCreditScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.storeCreditText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          localStore.customerToken.toString() != ""
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.myCouponsScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        LanguageConstants.myCouponsText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                ),
                          Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesConstants.countryScreen);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                          controller.countryCurrency.value,
                                         style: AppTextStyle.textStyleUtils400(
                                          size: 14.sp,
                                        ),),
                                    ),
                                  ),
                                ),
                          localStore.customerToken.toString() != ""
                              ? Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                )
                              : Container(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.companyText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.returnsAndRefundsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.returnsText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.referFriendScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.referFriendMyAccountText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.careersText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.giftVouchersText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.secureShoppingText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.shippingScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.shipping.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.socialText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.charityScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.ourSocialInitiativeText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.affiliateProgramScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.affiliateText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  RoutesConstants.influencerRegistrationScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants
                                      .influencerRegistrationText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.contactText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.trackYourOrderScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.trackYourOrder.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.traceYourTicketMail);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.trackYourTicketByEmail.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.guestReturnsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                   'Track your Order by guest',
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          Container(
                            height: 44.h,
                            color: profileTileBG,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.aboutText.tr,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AboutUsScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.aboutUs.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.teamsConditionScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.termsConditionsText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.privacyPolicyScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.privacyPolicyText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesConstants.contactUsScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.contactUsText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey.shade100,
                          ),
                          GestureDetector(
                            onTap: () {
                              showTitleDialog1(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CommonTextPoppins(
                                  LanguageConstants.liveChatText.tr,
                                  fontSize: 14.sp,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          localStore.customerToken.toString() == ""
                              ? Container()
                              : Divider(
                                  height: 1,
                                  color: Colors.grey.shade100,
                                ),
                          localStore.customerToken.toString() == ""
                              ? Container()
                              : GestureDetector(
                                  onTap: () async {
                                    showConfirmationDialog(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.w, top: 10.h, bottom: 10.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CommonTextPoppins(
                                        LanguageConstants
                                            .logOutTextavoirchic.tr,
                                        fontSize: 14.sp,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ));
  }

  Future showConfirmationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CommonAlertDialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.all(10),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Are You Sure To Log Out",
                          style: AppTextStyle.textStyleUtils400(
                            size: 14.sp,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
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
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.yes.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: darkBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: CommonTextOpenSans(
                              LanguageConstants.no.tr,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
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
            backgroundColor: whiteColor,
            insetPadding: const EdgeInsets.all(15),
            contentWidget: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  top: -40.0,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: appBarPrimary,
                    child: Image.asset(
                      AppAsset.account,
                      color: Colors.white,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
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
                            height: 75,
                            margin: const EdgeInsets.only(top: 50),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                        LanguageConstants.welcometoChatText.tr,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.textStyleUtils400(
                                            size: 15))),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                    child: Text(
                                        LanguageConstants.fillTheFormText.tr,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle
                                            .textStyleUtils400_12())),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: Column(
                              children: [
                                nameTextField(),
                                const SizedBox(
                                  height: 10,
                                ),
                                emailTextField(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: 45.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.isValid = true;
                                  controller.update(["MyAccount"]);
                                  if (controller.validation()) {
                                    if (controller.emailController.text != "" &&
                                        controller.firstNameController.text !=
                                            "") {
                                      Livechat.beginChat(
                                          AppConstants.licenceId,
                                          '1',
                                          controller
                                              .firstNameController.value.text
                                              .trim(),
                                          controller.emailController.value.text
                                              .trim());
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor: darkBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: CommonTextOpenSans(
                                  LanguageConstants.startChatText.tr,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
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

  Widget nameTextField() {
    return CommonTextField(
      validator: (value) => null,
      controller: controller.firstNameController,
      hintText: controller.isValid && controller.firstNameController.text == ""
          ? LanguageConstants.enterName.tr
          : LanguageConstants.nameChatText.tr,
    );
  }

  Widget emailTextField() {
    return CommonTextField(
      validator: (value) =>
          null /*Validators.validateEmail(
        value!.trim(),
      )*/
      ,
      controller: controller.emailController,
      hintText: controller.isValid && controller.emailController.text == ""
          ? LanguageConstants.enterEmailAddress.tr
          : LanguageConstants.emailText.tr,
    );
  }
}
