import 'package:solo_luxury/app/presentation/common_widget/customphonefield/countries.dart';
import 'package:solo_luxury/app/presentation/common_widget/customphonefield/intl_phone_field.dart';
import 'package:solo_luxury/app/presentation/common_widget/customphonefield/phone_number.dart';

import '../../../../all_imports.dart';

class CommonTextPhoneField extends StatelessWidget {
  final double? width;
  final String? hintText;
  final TextEditingController? textController;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? keyboardInputAction;
  final FormFieldValidator<PhoneNumber>? validator;
  final bool? isValidationShow;
  final Border? textFieldBorder;
  final Color? textColor;
  final String? fontFamily = "OpenSans";
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? borderColor;
  final double? height;
  final ValueChanged<PhoneNumber>? onChanged;
  final Color? cursorColor;
  final Color? dropdownTextColor;
  final Color? dropdownIconColor;
  final Color? errorBorderColor;
  final Color? hintColor;
  final ValueChanged<Country>? onCountryChanged;
  final BorderRadius? borderRadius;
  final TextStyle? fontStyle;
  final TextStyle? hintStyle;
  final TextStyle? dropdownTextStyle;
  final Color? fillColor;
  final bool? filled;
  final String? country;

  const CommonTextPhoneField(
      {Key? key,
      this.height = 40.0,
      this.hintText,
      this.textController,
      this.width,
      this.keyboardType,
      this.focusNode,
      this.keyboardInputAction,
      this.validator,
      this.isValidationShow = true,
      this.textFieldBorder,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.cursorColor,
      this.borderColor = appColorButton,
      this.fontWeight = FontWeight.w400,
      this.dropdownTextColor,
      this.dropdownIconColor,
      this.errorBorderColor = appColorButton,
      this.hintColor,
      this.onCountryChanged,
      this.borderRadius,
      this.fontStyle,
      this.hintStyle,
      this.dropdownTextStyle,
      this.fillColor,
      this.filled,
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
          // contentPadding: const EdgeInsets.only(top: 10),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? appColorButton, width: 1.0),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? appColorButton, width: 1.0),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: errorBorderColor ?? appColorButton, width: 1.0),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: errorBorderColor ?? appColorButton, width: 1.0),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? appColorButton, width: 1.0),
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          border: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(0))),
        ),
        initialCountryCode:
            (country?.isEmpty ?? false) || country == null ? 'IN' : country,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('^[0-9][0-9]*?[0-9]{0,10}')),
        ],
        validator: validator,
        onCountryChanged: onCountryChanged,
        onChanged: onChanged);
  }
}
