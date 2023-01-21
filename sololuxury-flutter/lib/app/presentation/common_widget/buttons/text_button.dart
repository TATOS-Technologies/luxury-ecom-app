import 'package:flutter/material.dart';
import 'package:solo_luxury/app/theme/app_text_style.dart';
import 'package:solo_luxury/app/theme/colors.dart';
import 'package:solo_luxury/app/theme/static_decoration.dart';

class PrimaryTextButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool autofocus;

  const PrimaryTextButton({
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
    return SizedBox(
      width: 160,
      height: 41,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(title.toString()),
      ),
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
