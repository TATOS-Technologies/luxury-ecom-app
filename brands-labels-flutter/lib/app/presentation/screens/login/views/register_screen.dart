import 'package:brandslabels/app/presentation/common_widgets/input_text_field_widget.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.firstNameText.tr,
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              nameTextField(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.lastName.tr,
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              surNameTextField(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.dateOfBirth.tr,
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              dobTextField(context),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.dateOfMarriage.tr,
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              marriageAnniversaryTextField(),
              const SizedBox(height: 11),
              Row(
                children: [
                  Text(
                    LanguageConstants.signUpForNewsletter.tr,
                    style: AppTextStyle.textStyleUtils500_12(),
                  ),
                ],
              ),
              const SizedBox(height: 11),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.email.tr,
                  style: AppTextStyle.textStyleUtils700(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              emailTextField(),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LanguageConstants.password.tr,
                          style: AppTextStyle.textStyleUtils600(
                            size: 12.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      passwordTextField(),
                    ],
                  )),
                  const SizedBox(width: 11),
                  Expanded(
                      child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LanguageConstants.confirmPassword.tr,
                          style: AppTextStyle.textStyleUtils600(
                            size: 12.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      confirmPasswordTextField(),
                    ],
                  )),
                ],
              ),
              const SizedBox(height: 25),
              createAnAccountButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.firstNameText.tr,
    );
  }

  Widget surNameTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.surNameTextveralusso.tr,
    );
  }

  Widget emailTextField() {
    return const EmailWidget(
      controller: null,
    );
  }

  Widget passwordTextField() {
    return PasswordWidget(
      controller: null,
      hintText: LanguageConstants.password.tr,
    );
  }

  Widget confirmPasswordTextField() {
    return PasswordWidget(
      controller: null,
      hintText: LanguageConstants.confirmPassword.tr,
    );
  }

  Widget dobTextField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showCalendar(context);
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: appColor, width: 1.15),
        ),
      ),
    );
  }

  Widget marriageAnniversaryTextField() {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.dateOfMarriage.tr,
    );
  }

  Widget createAnAccountButton() {
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: () {
          // registrationCtr.postRegistrationDetails();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstants.createAccountText,
          style: AppTextStyle.textStyleUtils600(
            color: Colors.white,
            size: 13.5,
          ),
        ),
      ),
    );
  }
}
