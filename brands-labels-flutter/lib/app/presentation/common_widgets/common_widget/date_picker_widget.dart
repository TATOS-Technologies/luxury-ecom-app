import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../theme/colors.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.filled,
    this.decoration,
    required this.enabled,
    this.autovalidate,
    this.validator,
    this.lastDate,
    this.format,
  }) : super(key: key);

  final String? labelText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final bool? filled;
  final InputDecoration? decoration;
  final bool enabled;
  final bool? autovalidate;
  final FormFieldValidator? validator;
  final DateTime? lastDate;
  final DateFormat? format;

  @override
  DatePickerWidgetState createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime expirydate2 = DateTime.now();

  static DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return FormField(builder: (FormFieldState state) {
      return DateTimeField(
        enabled: widget.enabled,
        controller: widget.controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(
              20,
              10,
              10,
              10,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(12)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(12)),
            fillColor: Colors.white,
            filled: true,
            // hintText: LanguageConstants.date.tr,
            hintText: widget.labelText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: hintGrey,
            )),
        validator: widget.validator,
        format: dateFormat,
        onShowPicker: (
          context,
          currentValue,
        ) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: expirydate2,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null && picked != expirydate2) {
            setState(() {
              expirydate2 = picked;
              debugPrint(expirydate2.toString());
            });
          }
          return picked;
        },
      );
    });
  }
}
