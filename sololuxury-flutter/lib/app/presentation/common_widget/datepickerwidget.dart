import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/meta_package.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget(
      {Key? key,
      this.labelText,
      this.prefixIcon,
      this.controller,
      this.filled,
      this.decoration,
      required this.enabled,
      this.autovalidate,
      this.validator,
      this.lastDate,
      this.format})
      : super(key: key);

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
  // final format = new DateFormat('E d,yyyy');

  static DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: FormField(builder: (FormFieldState state) {
        return DateTimeField(
          enabled: widget.enabled,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
            // contentPadding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkSilver),
                borderRadius: BorderRadius.circular(0)),
            fillColor: appTileBGcolor,
            filled: true,
            // hintText: "Date",
            hintText: widget.labelText,
          ),
          validator: widget.validator,
          format: dateFormat,
          onShowPicker: (context, currentValue) async {
            DateTime? pickedDate;
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: 350.h,
                color: homeBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          pickedDate = value;
                          print(pickedDate);
                        },
                        initialDateTime: DateTime(2010),
                        minimumDate: DateTime(1900),
                        maximumDate: DateTime.now(),
                      ),
                    ),
                    CommonThemeButton(
                        onTap: () {
                          
                          if (pickedDate != null ) {
                            debugPrint('hello $pickedDate');
                           
                            widget.controller!.text =
                                DateFormat("yyyy-MM-dd").format(pickedDate!);
                            Get.back();
                          }
                        },
                        title: LanguageConstants.submitText.tr),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              );
            });
            // final DateTime? picked = await showDatePicker(
            //   builder: (context, child) {
            //     return Theme(
            //         data: Theme.of(context).copyWith(
            //             colorScheme: const ColorScheme.light(
            //           primary: appColor, // header background color
            //           onPrimary: offWhite, // header text color
            //           onSurface: darkGrey,
            //         )),
            //         child: child!);
            //   },
            //   context: context,
            //   initialDate: expirydate2,
            //   firstDate: DateTime(1900),
            //   lastDate: DateTime.now(),
            // );
            // if (picked != null && picked != expirydate2) {
            //   setState(() {
            //     expirydate2 = picked;
            //     debugPrint(expirydate2.toString());
            //   });
            // }
            // return picked;
          },
        );
      }),
    );
  }
}
