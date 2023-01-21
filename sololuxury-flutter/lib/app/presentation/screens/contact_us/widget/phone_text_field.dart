import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';
import '../../../common_widget/common_widget/common_text_phone_field.dart';

class PhoneTextField extends GetView<ContactUsController> {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.isSubmitButtonPressed ? 56.h : 45.h,
      child: CommonTextPhoneField(
        filled: true,
        fillColor: appTileBGcolor,
        textController: controller.phoneController.value,
        cursorColor: regularGrey,
        dropdownIconColor: Colors.black,
        borderColor: Colors.transparent,
        dropdownTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
        fontStyle: const TextStyle(color: Colors.black, fontSize: 14),
        hintStyle: const TextStyle(
            fontFamily: AppConstants.fontOpenSans, fontSize: 14),
        errorBorderColor: Colors.red,
        country: Get.find<CountryController>().country?.value,
        hintText: LanguageConstants.phoneNumberText.tr,
        onCountryChanged: (country) {
          controller.countryCode = country.dialCode;
        },
        validator: (value) => Validators.validateMobile(
          value?.number ?? '',
        ),
      ),
    );
  }
}
