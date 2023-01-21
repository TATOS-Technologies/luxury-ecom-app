import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:get/get.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/input_text_field_widget.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.firstNameText.tr,
    );
  }
}

class SurNameTextField extends StatelessWidget {
  const SurNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.surNameTextsuv.tr,
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EmailWidget(
      controller: null,
      // },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
      controller: null,
      hintText: LanguageConstants.password.tr,
    );
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
      controller: null,
      hintText: LanguageConstants.confirmPassword.tr,
    );
  }
}

class DobTextField extends StatelessWidget {
  const DobTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class MarriageAnniversaryTextField extends StatelessWidget {
  const MarriageAnniversaryTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: null,
      hintText: LanguageConstants.dateOfMarriage.tr,
    );
  }
}

class CreateAnAccountButton extends StatelessWidget {
  const CreateAnAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          LanguageConstants.createAnAccountText.tr,
          style: AppTextStyle.textStyleUtils600(
            color: Colors.white,
            size: 13.5,
          ),
        ),
      ),
    );
  }
}
