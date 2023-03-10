import 'package:flutter/material.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/theme/static_decoration.dart';

// ignore: must_be_immutable
class PrimaryTextButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? buttonColor;
  Color? textColor;
  double? width;
  double? height;
  bool autofocus;

  PrimaryTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      autofocus: autofocus,
      style: TextButton.styleFrom(
        foregroundColor: textColor ?? primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: noBorderRadius,
        ),
        disabledForegroundColor: primaryWhite.withOpacity(0.38),
        backgroundColor: buttonColor ?? appColor,
        fixedSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 45,
        ),
        alignment: Alignment.center,
        textStyle: const TextStyle(
          fontFamily: AppConstants.fontPoppins,
          fontSize: 15,
          debugLabel: "Title",
          fontWeight: FontWeight.w500,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title.toString(),
          softWrap: true,
          textAlign: TextAlign.center,
          style: AppTextStyle.normalWhiteSemiBold16,
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class ImageButton extends StatelessWidget {
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String? imageLink;
  final IconData? iconLink;
  final String? buttonName;
  final Color? buttonColor;
  final double? iconHeight;
  final VoidCallback? onPressed;

  const ImageButton({
    Key? key,
    this.width,
    this.height,
    this.textStyle,
    this.buttonColor,
    this.imageLink,
    this.iconLink,
    this.iconHeight,
    required this.onPressed,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: circular5BorderRadius,
          color: buttonColor ?? whiteColor,
          border: Border.all(color: borderGrey, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconLink,
              color: primaryWhite,
              size: iconHeight ?? 26,
            ),
            width15,
            Text(buttonName.toString(),
                style: textStyle ?? AppTextStyle.normalSemiBold16),
          ],
        ),
      ),
    );
  }
}
