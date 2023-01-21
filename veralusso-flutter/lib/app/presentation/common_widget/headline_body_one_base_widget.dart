import 'package:flutter/material.dart';

class HeadlineBodyOneBaseWidget extends StatelessWidget {
  const HeadlineBodyOneBaseWidget({
    Key? key,
    this.title,
    this.titleColor,
    this.titleTextAlign = TextAlign.left,
    this.maxLine,
    this.textOverflow,
    this.fontSize,
    this.foreground,
    this.fontFamily,
    this.underline = false,
  }) : super(key: key);

  final String? title;
  final Color? titleColor;
  final TextAlign? titleTextAlign;
  final int? maxLine;
  final TextOverflow? textOverflow;
  final double? fontSize;
  final Paint? foreground;
  final String? fontFamily;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
          color: foreground == null ? titleColor : null,
          fontSize: fontSize,
          foreground: titleColor == null ? foreground : null,
          decoration: underline ? TextDecoration.underline : null,
          fontWeight: FontWeight.w400),
      textAlign: titleTextAlign,
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
