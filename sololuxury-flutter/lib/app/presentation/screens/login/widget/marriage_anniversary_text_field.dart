import '../../../../../all_imports.dart';
import '../../../common_widget/datepickerwidget.dart';

// class MarriageAnniversaryTextField extends GetView<SignupController> {
//   const MarriageAnniversaryTextField({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DatePickerWidget(
//       enabled: true,
//       controller: controller.marriageAnniversaryController.value,
//       labelText: LanguageConstants.dateOfMarriageText.tr,
//     );
//   }
// }

// dateOfBirthText

class DateOfBirthTextField extends GetView<SignupController> {
  const DateOfBirthTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePickerWidget(
      enabled: true,
      controller: controller.dateOfBirthController.value,
      labelText: LanguageConstants.dateOfBirthText.tr,
    );
  }
}
