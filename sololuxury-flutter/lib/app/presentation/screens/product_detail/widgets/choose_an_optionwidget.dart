import 'package:meta_package/api/models/size/size_model.dart';

import '../../../../../all_imports.dart';

class ChosseAnOpenWidget extends GetView<ProductDetailController> {
  const ChosseAnOpenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: appColorButton2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: appTileBorderColor)),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton(
            borderRadius: BorderRadius.circular(9),
            dropdownColor: appColorButton2,
            items: controller.listOfChoose
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value.label.toString()),
                  ),
                )
                .toList(),
            isExpanded: true,
            hint: controller.sizeList.toString() == "[]"
                ? CommonTextPoppins(
                    LanguageConstants.chooseAnOption.tr,
                  )
                : CommonTextPoppins(
                    controller.sizeList.first.label.toString(),
                    color: Colors.black,
                  ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 22,
              color: Colors.black,
            ),
            iconEnabledColor: Colors.transparent,
            onChanged: (SizeModel? valueList) {
              debugPrint("Val $valueList");
              controller.sizeList.clear();
              controller.sizeList.add(valueList!);
              if (controller.sizeList.first.value == "Missing") {
                controller.showDialogBoxOpen(context, true);
              }
            },
          ),
        ),
      ),
    );
  }
}
