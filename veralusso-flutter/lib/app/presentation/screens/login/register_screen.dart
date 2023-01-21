import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/presentation/common_widget/input_text_field_widget.dart';
import 'package:veralusso/app/presentation/screens/login/widgets/dob_text_field.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'widgets/create_an_account_button.dart';
import 'package:get/get.dart';

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
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              TextFormFieldWidget(
                controller: null,
                hintText: LanguageConstants.firstNameText.tr,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.lastNameText.tr,
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              TextFormFieldWidget(
                controller: null,
                hintText: LanguageConstants.surNameText.tr,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.dateOfBirth.tr,
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              const DobTextField(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.dateOfMarriage.tr,
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              TextFormFieldWidget(
                controller: null,
                hintText: LanguageConstants.dateOfMarriage.tr,
              ),
              const SizedBox(height: 11),
              Text(
                LanguageConstants.signUpForNewsletter.tr,
                style: AppTextStyle.textStyleUtils500_12(),
              ),
              const SizedBox(height: 11),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.email.tr,
                  style: AppTextStyle.textStyleUtils600(size: 12.5),
                ),
              ),
              const SizedBox(height: 7.5),
              const EmailWidget(
                controller: null,
              ),
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
                          style: AppTextStyle.textStyleUtils600(size: 12.5),
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      PasswordWidget(
                        controller: null,
                        hintText: LanguageConstants.password.tr,
                      ),
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
                          style: AppTextStyle.textStyleUtils600(size: 12.5),
                        ),
                      ),
                      const SizedBox(height: 7.5),
                      PasswordWidget(
                        controller: null,
                        hintText: LanguageConstants.confirmPassword.tr,
                      ),
                    ],
                  )),
                ],
              ),
              const SizedBox(height: 25),
              const CreateAnAccountButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
