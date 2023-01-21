import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/select_country/select_country_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class DetailsButton extends GetView<SelectCountryController> {
  final String text;
  final int value;

  const DetailsButton(this.text, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.index.value == value) {
          controller.index.value = 0;
        } else {
          controller.index.value = value;
        }
      },
      child: Container(
        height: 50,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0xff973133),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyle.textStyleUtils500_16(color: Colors.white),
            ),
            const SizedBox(width: 10),
            text == "About us"
                ? Icon(
                    controller.index.value == 1 ? Icons.remove : Icons.add,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
          ],
        ),
      ),
    );
  }
}
