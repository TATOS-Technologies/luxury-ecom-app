import 'package:brandslabels/app/controller/signup_controller.dart';
import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/presentation/common_widgets/headline_body_one_base_widget.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementWidget extends GetView<SignUpController> {
  AgreementWidget({Key? key}) : super(key: key);
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Column(children: [
       
         Row(
            children: [
              Checkbox(
                  activeColor: controller.checkBoxFillColor.value,
                  value: controller.isChecked.value,
                  onChanged: (value) {
                    controller.isChecked.value = !controller.isChecked.value;
                  }),
               Expanded(
                child: HeadlineBodyOneBaseWidget(
                  title:
                      LanguageConstants.marketingPurposeTextBrandsandLabels.tr,
                  fontSize: 13,
                  titleColor: blackColor,
                ),
              ),
            ],
          ),
      
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Checkbox(
                activeColor: controller.checkBoxFillColor.value,
                checkColor: whiteColor,
                value: controller.isSelected.value,
                onChanged: (value) {
                  controller.isSelected.value = !controller.isSelected.value;
                }),
             Expanded(
              child: HeadlineBodyOneBaseWidget(
                title:
                    LanguageConstants.shoppingHabitTextBrandsandLabels.tr,
                fontSize: 13,
                titleColor: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ]),
    );
  }
}
