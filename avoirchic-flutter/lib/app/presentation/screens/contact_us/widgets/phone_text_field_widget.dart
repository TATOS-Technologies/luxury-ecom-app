import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../controller/contact_us_controller.dart';
import '../../../../controller/country_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';
import '../../../common_widgets/common_text_phone_field.dart';

class PhoneTextField extends GetView<ContactUsController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: CommonTextPhoneField(
        textController: controller.phoneController.value,
        cursorColor: regularGrey,
        dropdownIconColor: Colors.black,
        borderColor: borderGrey,
        dropdownTextStyle: AppTextStyle.textStyleUtils400(),
        fontStyle: AppTextStyle.textStyleUtils400(),
        hintStyle: AppTextStyle.textStyleUtils400(),
        errorBorderColor: Colors.red,
        country: Get.find<CountryController>().country?.value,
        hintText: LanguageConstants.phoneNumberText.tr,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(value?.number ?? ''),
      ),
    );
  }
}
