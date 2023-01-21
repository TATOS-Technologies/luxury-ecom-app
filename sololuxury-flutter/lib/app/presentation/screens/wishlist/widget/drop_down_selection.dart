import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class DropDownSelection extends GetView<WishlistController> {
  const DropDownSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: wishListBorder),
      ),
      height: 40,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          alignment: AlignmentDirectional.center,
          isExpanded: true,
          dropdownColor: offWhite,
          value: controller.chosenValue.value,
          style: AppStyle.textStyleUtils400_16(color: appColorPrimary),
          items: <String>[
            LanguageConstants.myAccountText.tr,
            LanguageConstants.myOrdersText.tr,
            LanguageConstants.myWishlistText.tr,
            LanguageConstants.addressBookText.tr,
            LanguageConstants.accountInformationText.tr,
            LanguageConstants.myTicketsText.tr,
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Icon(Icons.expand_more, color: appColorPrimary),
          hint: Center(
            child: Text(
              LanguageConstants.myWishlistText.tr,
              textAlign: TextAlign.center,
              style: AppStyle.textStyleUtils400_16(color: appColor),
            ),
          ),
          onChanged: (String? value) {
            controller.chosenValue.value = value!;
          },
        ),
      ),
    );
  }
}
