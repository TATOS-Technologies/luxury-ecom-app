import 'package:flutter/material.dart';

class CommonAlertDialog extends StatelessWidget {
  final Widget? contentWidget;
  final Widget? titleWidget;
  final List<Widget>? actionWidgets;
  final double? elevation;
  final double? radius;
  final EdgeInsets insetPadding;
  final EdgeInsets? contentPadding;
  final Color? backgroundColor;
  final Clip clipBehavior;

  const CommonAlertDialog({
    Key? key,
    this.actionWidgets,
    required this.contentWidget,
    this.elevation,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.contentPadding,
    this.backgroundColor,
    this.titleWidget,
    this.clipBehavior = Clip.none,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget,
      elevation: elevation,
      shape: radius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 0),
              ),
            )
          : null,
      contentPadding: contentPadding ?? EdgeInsets.zero,
      insetPadding: insetPadding,
      backgroundColor: backgroundColor,
      clipBehavior: clipBehavior,
      content: contentWidget,
      actions: actionWidgets,
    );
  }
}
