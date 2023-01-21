import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/country_controller.dart';
import 'package:brandslabels/app/controller/influencer_registration_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/common_text_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:brandslabels/app/theme/colors.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:
          commonAppbar(title: LanguageConstants.influencerRegistrationText.tr),
      body: Obx(() => controller.isLoading.value == true
          ? const Center(
              child: SpinKitThreeBounce(
              color: appBarPrimary,
              // size: 50.0,
            ))
          : influencerDesign(context)),
    );
  }

  Widget textFormField(
      {String? hintText,
      double? height,
      double? bottomPadding,
      Color? borderColor,
      double? topPadding,
      FormFieldValidator<String>? validation,
      TextEditingController? controller}) {
    return Container(
      alignment: Alignment.center,
      // height: height ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:borderColor?? textfieldBorderGrey,
          width: 2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator: validation,
        cursorColor: blackColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              bottom: bottomPadding ?? 5, left: 12, top: topPadding ?? 0),
          hintText: hintText,
          hintStyle: AppTextStyle.textStyleUtils400(color: grey636363),
        ),
      ),
    );
  }

  Widget influencerDesign(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: controller.formKey.value,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.w),
          child: GetBuilder<InfluencerRegistrationController>(
            id: "influencer",
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.profile.tr,
                    style: AppTextStyle.textStyleUtilsUnderLine18(
                        fontWeight: FontWeight.w400,
                        thickness: 1,
                        color: darkBlue),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: textfieldBorderGrey,width: 2)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                padding: const EdgeInsets.all(1),
                                child: DropdownButton<String>(
                                  isExpanded: false,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  value: controller.selectedStatus.value,
                                  iconSize: 15,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: controller.status.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? val) {
                                    controller.selectedStatus.value = val!;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              child: textFormField(
                                borderColor: Colors.transparent,
                                hintText: controller.isValid &&
                                        controller.firstName.value.text == ""
                                    ? LanguageConstants.enterFirstName.tr
                                    : LanguageConstants.firstNameText.tr,
                                controller: controller.firstName.value,
                                validation: (value) => null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    
                    child: textFormField(
                      hintText: controller.isValid &&
                              controller.lastName.value.text == ""
                          ? LanguageConstants.enterLastName.tr
                          : LanguageConstants.lastNameText.tr,
                      controller: controller.lastName.value,
                      validation: (value) => null,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          
                          child: textFormField(
                            hintText: controller.isValid &&
                                    controller.email.value.text == ""
                                ? LanguageConstants.enterEmailAddress.tr
                                : LanguageConstants.emailText.tr,
                            controller: controller.email.value,
                            validation: (value) => null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          
                          child: CommonTextPhoneField(
                            textController: controller.contactNo.value,
                            cursorColor: blackColor,
                            dropdownIconColor: Colors.black,
                            borderColor: textfieldBorderGrey,
                            country:
                                Get.find<CountryController>().country.value,
                            focusedColor: Colors.black,
                            dropdownTextStyle: AppTextStyle.textStyleUtils400(),
                            fontStyle: AppTextStyle.textStyleUtils400(),
                            hintStyle: AppTextStyle.textStyleUtils400(),
                            errorBorderColor: Colors.red,
                            hintText: controller.isValid &&
                                    controller.contactNo.value.text == ""
                                ? LanguageConstants.enterPhoneNumber.tr
                                : LanguageConstants.contactNoText.tr,
                            onCountryChanged: (country) {
                              controller.countryCode = country.dialCode;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  /*    Obx(() => Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.topLeft,child: errorTextWidget(controller.phoneErrorMsg.value)),
              )),*/
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          
                          child: textFormField(
                            hintText: LanguageConstants.websiteUrlText.tr,
                            controller: controller.websiteUrl.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: textFormField(
                            hintText: LanguageConstants.cityText.tr,
                            controller: controller.city.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: textFormField(
                            hintText: LanguageConstants.countryText.tr,
                            controller: controller.country.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: textFormField(
                            hintText: LanguageConstants.postCodeText.tr,
                            controller: controller.postCode.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.socialLinksText.tr,
                    style: AppTextStyle.textStyleUtilsUnderLine18(
                        fontWeight: FontWeight.w400,
                        thickness: 1,
                        color: darkBlue),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.facebookText.tr,
                            controller: controller.faceBook.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.instagramText.tr,
                            controller: controller.instagram.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText:
                                '${LanguageConstants.youtubeText.tr}twitter',
                            controller: controller.twitter.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.youtubeText.tr,
                            controller: controller.youtube.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.linkendinText.tr,
                            controller: controller.linkedin.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.pinterestText.tr,
                            controller: controller.pinterest.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    LanguageConstants.followersText.tr,
                    style: AppTextStyle.textStyleUtilsUnderLine18(
                        fontWeight: FontWeight.w400,
                        thickness: 1,
                        color: darkBlue),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.facebookText.tr,
                            controller: controller.faceBookFollower.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.instagramText.tr,
                            controller: controller.instagramFollower.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText:
                                '${LanguageConstants.youtubeText.tr}twitter',
                            controller: controller.twitterFollower.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.youtubeText.tr,
                            controller: controller.youtubeFollower.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.linkendinText.tr,
                            controller: controller.linkedinFollower.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                        
                          child: textFormField(
                            hintText: LanguageConstants.pinterestText.tr,
                            controller: controller.pinterestFollower.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                  
                    child: textFormField(
                      hintText: LanguageConstants.workedOnText.tr,
                      controller: controller.projectWork.value,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 327.w,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.influencerReg(
                            context, controller.formKey.value);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: CommonTextOpenSans(
                        LanguageConstants.submitText.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
