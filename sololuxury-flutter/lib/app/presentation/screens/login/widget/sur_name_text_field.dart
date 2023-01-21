import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class SurNameTextField extends GetView<SignupController> {
  const SurNameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: Center(
        child: TextFormFieldWidget(
          controller: controller.lastNameController.value,
          hintText: LanguageConstants.lastNameText.tr,
          validator: (value) => Validators.validateName(
            value?.trim(),
          ),
        ),
      ),
    );
  }
}
