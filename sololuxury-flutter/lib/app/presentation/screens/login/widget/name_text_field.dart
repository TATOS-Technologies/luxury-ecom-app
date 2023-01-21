import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/utils/validator.dart';

import '../../../../../all_imports.dart';

class NameTextField extends GetView<SignupController> {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: 327.w,
          child: Center(
              child: Container(
            decoration: BoxDecoration(
                color: appTileBGcolor, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                DropdownButton<String>(
                  dropdownColor: appTileBGcolor,
                  value: controller.mrms.value,
                  items: [
                    DropdownMenuItem(
                      value: 'Mr',
                      child: Text(LanguageConstants.mr.tr),
                    ),
                    DropdownMenuItem(
                        value: 'Ms', child: Text(LanguageConstants.msText.tr)),
                  ],
                  onChanged: (value) {
                    controller.mrms.value = value!;
                  },
                ),
                Expanded(
                  child: TextFormFieldWidget(
                    controller: controller.firstNameController.value,
                    hintText: controller.isValidation.value == true &&
                            controller.firstNameController.value.text == ""
                        ? LanguageConstants.enterFirstName.tr
                        : LanguageConstants.firstNameText.tr,
                    validator: (value) => Validators.validateName(
                      value?.trim(),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
