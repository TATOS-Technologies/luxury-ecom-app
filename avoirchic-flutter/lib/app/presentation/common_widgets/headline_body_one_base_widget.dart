import 'package:avoirchic/app/theme/colors.dart';
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
    this.isLoaderShowing = false,
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
  final bool isLoaderShowing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoaderShowing
            ? Container(
                margin: const EdgeInsets.only(right: 15),
                height: 16,
                width: 16,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                ),
              )
            : const SizedBox.shrink(),
        Text(
          title!,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: foreground == null ? titleColor : null,
                fontSize: fontSize,
                foreground: titleColor == null ? foreground : null,
                fontWeight: FontWeight.w400,
                decoration: underline ? TextDecoration.underline : null,
              ),
          textAlign: titleTextAlign,
          maxLines: maxLine,
          overflow: textOverflow,
          softWrap: true,
        ),
      ],
    );
  }
}
