import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class SelectReasonDialog extends StatelessWidget {
  const SelectReasonDialog({
    Key? key,
    required this.reasonList,
    required this.selectedReason,
    required this.onTap,
    this.fromReturn = false,
  }) : super(key: key);
  final List<String> reasonList;
  final RxString selectedReason;
  final GestureTapCallback? onTap;
  final bool fromReturn;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonAlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // titlePadding: EdgeInsets.zero,
        backgroundColor: const Color(0xFFF9EAE3),
        contentWidget: SizedBox(
          width: double.maxFinite,
          child: Form(
            // key: formKey.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.close,
                      size: 22,
                      color: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.close,
                          size: 22,
                          color: appColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15.6,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: const Color(0xFFDEC5B9), width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: backGroundColor,
                        items: reasonList
                            .map(
                              (value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value.toString()),
                              ),
                            )
                            .toList(),
                        isExpanded: true,
                        hint: selectedReason.value == ""
                            ? Text(
                                fromReturn
                                    ? LanguageConstants.reasonReturnText.tr
                                    : LanguageConstants.reasonCancelText.tr,
                                style: TextStyle(
                                  color: const Color(0xFF6B6B6B).withOpacity(0.6),
                                  fontSize: 14,
                                ),
                              )
                            : Text(
                                selectedReason.value,
                                style: const TextStyle(color: Color(0xFF6B6B6B)),
                              ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: appColor,
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (value) {
                          selectedReason.value = value!;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                    decoration: BoxDecoration(color: appColor, borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      fromReturn ? LanguageConstants.returnItemText.tr : LanguageConstants.cancelItemText.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
