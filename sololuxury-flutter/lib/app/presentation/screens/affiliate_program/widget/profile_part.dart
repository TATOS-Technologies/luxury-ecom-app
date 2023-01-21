import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';
import '../../../common_widget/common_widget/common_text_phone_field.dart';

class ProfilePart extends StatelessWidget {
  const ProfilePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AffiliateProgramController>(
      id: "affil",
      builder: (controller) {
        return Form(
          key: controller.formKey.value,
          child: Column(
            children: [
              HeadlineBodyOneBaseWidget(
                title: LanguageConstants.profile.tr,
                titleColor: Colors.black,
                titleTextAlign: TextAlign.center,
                underline: true,
                fontSize: 16.0,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onChanged: (String? value) {
                            controller.selectedVisitorValue.value =
                                value.toString();
                          },
                          icon: Image.asset(AppAsset.downArrow,
                              height: 16, width: 16.0),
                          value: controller.selectedVisitorValue.value,
                          items: <String>[
                            LanguageConstants.visitorMonthHintText.tr,
                            LanguageConstants.mr.tr,
                            LanguageConstants.mrs.tr
                          ]
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: HeadlineBodyOneBaseWidget(
                                    title: value,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: Get.width,
                      child: TextFormFieldWidget(
                        controller: controller.firstNameController.value,
                        focusNode: controller.focusNode.value,
                        unFillField: true,
                        hintText: LanguageConstants.firstNameText.tr,
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.grey),
                        validator: (value) {
                          return Validators.validateName(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 40,
                child: TextFormFieldWidget(
                  controller: controller.lastNameController.value,
                  focusNode: controller.lastNameFocusNode.value,
                  unFillField: true,
                  hintText: LanguageConstants.lastNameText.tr,
                  hintStyle: AppTextStyle.textStyleUtils400(color: Colors.grey),
                  validator: (value) {
                    return Validators.validateName(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: Get.width,
                      child: TextFormFieldWidget(
                        controller: controller.emailController.value,
                        focusNode: controller.emailFocusNode.value,
                        keyboardType: TextInputType.emailAddress,
                        unFillField: true,
                        hintText: LanguageConstants.emailText.tr,
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.grey),
                        validator: (value) {
                          return Validators.validateEmail(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: Get.width,
                      child: CommonTextPhoneField(
                        textController: controller.contactNoController.value,
                        textColor: appColorButton,
                        cursorColor: appColorButton,
                        // dropdownTextColor: brownColorCEAE9F,
                        dropdownIconColor: appColorButton,
                        borderColor: Colors.black,
                        errorBorderColor: Colors.black,
                        hintStyle: const TextStyle(
                            fontFamily: AppConstants.fontOpenSans,
                            fontSize: 14,
                            color: Colors.grey),
                        dropdownTextStyle: const TextStyle(fontSize: 14),
                        hintText: LanguageConstants.contactNoText.tr,
                        hintColor: appColorButton,
                        country: Get.find<CountryController>().country?.value,
                        onCountryChanged: (country) {
                          controller.countryCode = country.dialCode;
                        },
                        validator: (value) => Validators.validateMobile(
                          value?.number ?? '',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 40,
                      width: Get.width,
                      child: TextFormFieldWidget(
                        controller: controller.websiteController.value,
                        focusNode: controller.websiteNoFocusNode.value,
                        hintStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.grey),
                        unFillField: true,
                        hintText: LanguageConstants.websiteUrlText.tr,
                        validator: (value) {
                          return Validators.validateRequired(
                              value ?? '', LanguageConstants.websiteUrlText.tr);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
