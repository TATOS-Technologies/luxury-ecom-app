import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        onChanged: (String? value) {},
        icon: Image.asset(
          AppAsset.downArrow,
          height: 16,
          width: 16.0,
          color: appColorButton,
        ),
        //value: controller.selectedValue.value,
        hint: Text(
          LanguageConstants.myAccountText.tr,
          style: AppStyle.textStyleUtils400(color: appColorButton),
        ),
        style: AppStyle.textStyleUtils400(color: appColorButton),
        items: <String>[LanguageConstants.mr.tr, LanguageConstants.mrs.tr]
            .map(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: HeadlineBodyOneBaseWidget(
                  title: value,
                  fontSize: 14,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
