import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/screens/login/widgets/register_field.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
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
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              const NameTextField(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LanguageConstants.lastNameText.tr,
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              const SurNameTextField(),
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
              const DobTextField(),
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
              const MarriageAnniversaryTextField(),
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
                  style: AppTextStyle.textStyleUtils600(
                    size: 12.5,
                  ),
                ),
              ),
              const SizedBox(height: 7.5),
              const EmailTextField(),
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
                      const PasswordTextField(),
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
                      const ConfirmPasswordTextField(),
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
