import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/countries.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/intl_phone_field.dart';
import 'package:brandslabels/app/presentation/common_widgets/custom_phone_field/phone_number.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextPhoneField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final FormFieldValidator<PhoneNumber>? validator;
  final String? fontFamily = "OpenSans";
  final Color? borderColor;
  final ValueChanged<PhoneNumber>? onChanged;
  final Color? cursorColor;
  final Color? dropdownIconColor;
  final Color? errorBorderColor;
  final ValueChanged<Country>? onCountryChanged;
  final BorderRadius? borderRadius;
  final TextStyle? fontStyle;
  final TextStyle? hintStyle;
  final TextStyle? dropdownTextStyle;
  final Color? fillColor;
  final bool? filled;
  final Color? focusedColor;
  final String? country;

  const CommonTextPhoneField(
      {Key? key,
      this.hintText,
      this.textController,
      this.validator,
      this.cursorColor,
      this.borderColor = appColor,
      this.dropdownIconColor,
      this.errorBorderColor = appColor,
      this.onCountryChanged,
      this.borderRadius,
      this.fontStyle,
      this.hintStyle,
      this.dropdownTextStyle,
      this.fillColor,
      this.filled,
      this.focusedColor,
      this.onChanged,
      this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: textController,
      flagsButtonMargin: const EdgeInsets.only(left: 5.0),
      style: fontStyle,
      cursorColor: cursorColor,
      dropdownTextStyle: dropdownTextStyle,
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
        color: dropdownIconColor,
      ),
      disableLengthCheck: true,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedColor ?? Colors.black, width: 1),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.black, width: 1),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(0.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(0.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? Colors.black, width: 1),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      initialCountryCode: (country?.isEmpty ?? false) || country == null
          ? 'IN'
          : country.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('^[0-9][0-9]*?[0-9]{0,10}')),
      ],
      onCountryChanged: onCountryChanged,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
