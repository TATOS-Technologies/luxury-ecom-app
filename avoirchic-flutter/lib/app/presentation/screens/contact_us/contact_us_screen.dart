import 'package:avoirchic/app/presentation/screens/contact_us/widgets/email_confirmation_text_field.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/email_text_field_widget.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/name_text_field_widget.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/phone_text_field_widget.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/subject_text_field_widget.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/submit_account_button.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/surname_text_field.dart';
import 'package:avoirchic/app/presentation/screens/contact_us/widgets/whats_on_your_mind_field_widget.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/contact_us_controller.dart';
import '../../../core/utils/lang_directory/language_constant.dart';
import '../../../theme/colors.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              LanguageConstants.contactUsText.tr,
            ),
            elevation: 0,
          ),
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(color: whiteColor),
              ),
              Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: GetBuilder<ContactUsController>(
                      id: "Contact",
                      builder: (controller) => Column(
                        children: [
                          // commonAppbar(appBarColor: Colors.transparent),
                          // const SizedBox(height: 20),

                          const SizedBox(
                            height: 20,
                          ),
                          Text(LanguageConstants.queryDescription.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils400(size: 12.5)
                                  .copyWith(
                                height: 1.4,
                              )),
                          const SizedBox(height: 20),
                          SizedBox(height: 40.h, child: const NameTextField()),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 40.h, child: const SurNameTextField()),
                          const SizedBox(height: 12),
                          SizedBox(height: 40.h, child: const EmailTextField()),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 40.h,
                              child: const EmailConfirmationTextField()),
                          const SizedBox(height: 12),
                          Obx(() => Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 40.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: borderGrey,
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                    icon: const Icon(
                                      Icons.expand_more_outlined,
                                      color: appColor,
                                    ),
                                    value: controller.chosenValue.value,
                                    elevation: 2,
                                    style: AppTextStyle.textStyleUtils400(
                                      color: grey636363,
                                    ),
                                    items: controller.data
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(value),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      LanguageConstants.typeOfEnquiryText.tr,
                                      style: AppTextStyle.textStyleUtils400(
                                          color: grey636363),
                                    ),
                                    onChanged: (String? value) {
                                      controller.chosenValue.value = value!;
                                    },
                                  ),
                                ),
                              )),
                          const SizedBox(height: 12),
                          const PhoneTextField(),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 40.h, child: const SubjectTextField()),
                          const SizedBox(height: 12),
                          SizedBox(
                              height: 40.h,
                              child: const WhatsOnYourMindTextField()),
                          const SizedBox(height: 12),
                          Obx(() => Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 40.h,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: borderGrey,
                                    width: 1,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                    icon: const Icon(
                                      Icons.expand_more_outlined,
                                      color: appColor,
                                    ),
                                    value: controller.chosenCountry.value,
                                    elevation: 2,
                                    style: AppTextStyle.textStyleUtils400(
                                        color: grey636363),
                                    items: controller
                                        .countryController.storeWebsitesList
                                        .map((item) {
                                      return DropdownMenuItem(
                                          value: item.name.toString(),
                                          child: Text(
                                            item.name ?? '',
                                            //Names that the api dropdown contains
                                            style: AppTextStyle
                                                .textStyleUtils400(),
                                          ) //Id that has to be passed that the dropdown has.....
                                          //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                          );
                                    }).toList(),
                                    hint: Text(
                                      LanguageConstants.countryText.tr,
                                      style: AppTextStyle.textStyleUtils400(
                                          color: grey636363),
                                    ),
                                    onChanged: (String? value) {
                                      controller.chosenCountry.value = value!;
                                    },
                                  ),
                                ),
                              )),
                          //countryTextField(),
                          const SizedBox(height: 20),
                          const SubmitAccountButton(),
                          const SizedBox(height: 30),
                          Text(
                            LanguageConstants.headOffice.tr,
                            style: AppTextStyle.textStyleUtils600(
                                color: appBorderColor, size: 16.5),
                          ),
                          const SizedBox(height: 10),
                          Text('AVOIR-CHIC, O LABELS LTD,',
                              style: AppTextStyle.textStyleUtils500(
                                  color: appBorderColor, size: 13)),
                          const SizedBox(height: 5),
                          Text('20-22 WENLOCK ROAD, LONDON, N1 7GU',
                              style: AppTextStyle.textStyleUtils500(
                                  color: appBorderColor, size: 13)),
                          const SizedBox(height: 10),
                          Text('customercare@avoir-chic.com',
                              style: AppTextStyle.textStyleUtils400(
                                      color: appBorderColor, size: 12.5)
                                  .copyWith(
                                      decoration: TextDecoration.underline)),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
