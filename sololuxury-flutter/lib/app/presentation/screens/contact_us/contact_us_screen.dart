import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/email_confirmation_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/email_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/name_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/phone_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/subject_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/submit_account_button.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/sur_name_text_field.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/widget/whats_on_your_mind_text_field.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: homeBackground,
        appBar: commonAppbar(title: LanguageConstants.contactUsText.tr),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  SizedBox(height: 20.h),
                  const NameTextField(),
                  SizedBox(height: 15.w),
                  const SurNameTextField(),
                  SizedBox(height: 15.w),
                  const EmailTextField(),
                  SizedBox(height: 15.w),
                  const EmailConfirmationTextField(),
                  SizedBox(height: 15.w),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: appTileBGcolor,
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: appColorFDF3F1,
                        icon: const Icon(Icons.expand_more_outlined,
                            color: Colors.black),
                        value: controller.chosenValue.value,
                        style: AppStyle.textStyleUtils400(color: Colors.grey),
                        elevation: 2,
                        items: controller.data
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          LanguageConstants.typeOfEnquiryText.tr,
                        ),
                        onChanged: (String? value) {
                          controller.chosenValue.value = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15.w),
                  const PhoneTextField(),
                  SizedBox(height: 15.w),
                  const SubjectTextField(),
                  SizedBox(height: 15.w),
                  const WhatsOnYourMindTextField(),
                  SizedBox(height: 15.w),

                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: appTileBGcolor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: appTileBGcolor,
                        width: 1.2,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(12),
                        isExpanded: true,
                        dropdownColor: appTileBGcolor,
                        style: AppStyle.textStyleUtils400(color: Colors.grey),
                        icon: const Icon(Icons.expand_more_outlined,
                            color: Colors.black),
                        value: controller.chosenCountry.value,
                        elevation: 2,
                        items:
                            controller.countryController.storeWebsitesList.map(
                          (item) {
                            return DropdownMenuItem(
                                value: item.name.toString(),
                                child: Text(
                                  item.name ?? '',
                                  //Names that the api dropdown contains
                                  style: AppStyle.textStyleUtils400(size: 15.0),
                                ) //Id that has to be passed that the dropdown has.....
                                //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
                                );
                          },
                        ).toList(),
                        hint: Text(LanguageConstants.countryText.tr),
                        onChanged: (String? value) {
                          controller.chosenCountry.value = value!;
                        },
                      ),
                    ),
                  ),
                  //countryTextField(),
                  const SizedBox(height: 20),
                  Obx(() => controller.isLoading.isTrue
                      ? const Center(
                          child: SpinKitThreeBounce(
                            color: appColor,
                            // size: 50.0,
                          ),
                        )
                      : const SubmitAccountButton()),
                  const SizedBox(height: 30),
                  Text(
                    LanguageConstants.headOffice.tr,
                    style: AppStyle.textStyleUtils600(
                      color: appColor,
                      size: 16.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    LanguageConstants.officeAddrLine1.tr,
                    style: AppStyle.textStyleUtils500(
                      color: appColor,
                      size: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    LanguageConstants.officeAddrLine2.tr,
                    style: AppStyle.textStyleUtils500(
                      color: appColor,
                      size: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'customercare@sololuxury.com',
                    style: AppStyle.textStyleUtils500(
                      color: appColor,
                      size: 12.5,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
