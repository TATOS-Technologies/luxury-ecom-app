import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import '../../../../controller/returns_and_refunds_controller.dart';
import 'package:get/get.dart';
import '../../../../theme/app_text_style.dart';

class BulletList extends GetView<ReturnsAndRefundsController> {
  final List<String> strings;
  final bool isSelected;

  const BulletList({required this.strings, required this.isSelected, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: strings.map((str) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConstants.u2022Text.tr,
                      style: AppTextStyle.textStyleUtils400().copyWith(
                        height: 1.30,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        str,
                        textAlign: TextAlign.left,
                        // softWrap: true,
                        style: AppTextStyle.textStyleUtils400().copyWith(
                          height: 1.30,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
