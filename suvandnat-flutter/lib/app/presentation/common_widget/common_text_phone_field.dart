import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suvandnat/app/presentation/common_widget/CustomPhoneField/countries.dart';
import 'package:suvandnat/app/presentation/common_widget/CustomPhoneField/intl_phone_field.dart';
import 'package:suvandnat/app/presentation/common_widget/CustomPhoneField/phone_number.dart';
import 'package:suvandnat/app/theme/colors.dart';

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
  final String? initialCountryCode;
  final String? country;

  const CommonTextPhoneField(
      {Key? key,
      this.hintText,
      this.textController,
      this.validator,
      this.cursorColor,
      this.borderColor = borderGrey,
      this.dropdownIconColor,
      this.errorBorderColor = borderGrey,
      this.onCountryChanged,
      this.borderRadius,
      this.fontStyle,
      this.hintStyle,
      this.dropdownTextStyle,
      this.fillColor,
      this.filled,
      this.focusedColor,
      this.initialCountryCode,
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
        fillColor: whiteColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  borderColor??borderGrey, width: 2),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  borderColor??borderGrey, width: 2),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:BorderSide(color:  borderColor??borderGrey, width: 2),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  errorBorderColor??borderGrey, width: 2),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  errorBorderColor??borderGrey, width: 2),
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color:borderGrey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      initialCountryCode:
          (country?.isEmpty ?? false) || country == null ? 'IN' : country.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('^[0-9][0-9]*?[0-9]{0,10}')),
      ],
      onCountryChanged: onCountryChanged,
      onChanged: onChanged,
    );
  }
}
