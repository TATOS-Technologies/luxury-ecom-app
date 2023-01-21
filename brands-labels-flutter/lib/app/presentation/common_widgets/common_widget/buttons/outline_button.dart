import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:brandslabels/app/theme/static_decoration.dart';
import 'package:flutter/material.dart';

class OutlineBorderButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double? height;
  final double? width;
  final double? radius;
  final double? fontSize;

  final Color? textColor;
  final Color? borderColor;
  final ButtonTextTheme? textTheme;

  const OutlineBorderButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    this.textColor,
    this.borderColor,
    this.onLongPress,
    this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: circular5BorderRadius,
          ),
          side: BorderSide(color: borderColor ?? appColor, width: 1),
        ),
        onPressed: onPressed,
        child: Text(
          title.toString(),
          style: AppTextStyle.normalSemiBold15.copyWith(color: textColor),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OutlineIconButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? color;
  Icon icon;

  OutlineIconButton({
    Key? key,
    this.color,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
      ),
      label: Text(title.toString()),
      icon: icon,
      onPressed: onPressed,
    );
  }
}
