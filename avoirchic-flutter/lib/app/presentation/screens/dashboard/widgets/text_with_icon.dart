import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controller/dashboard_controller.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/colors.dart';

class TextWithIcon extends GetView<DashboardController> {
  final String? name;
  final TextStyle? style;
  final bool isIcon;

  final bool isExpand;

  final GestureTapCallback? onTapExpand;
  final GestureTapCallback? onTapCollapse;

  const TextWithIcon(
      {Key? key,
      required this.name,
      required this.style,
      required this.isIcon,
      required this.isExpand,
      this.onTapExpand,
      this.onTapCollapse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isExpand ? onTapExpand : onTapCollapse,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name!, overflow: TextOverflow.ellipsis, style: style),
            isIcon
                ? Container()
                : Image.asset(
                    !isExpand ? AppAsset.rightArrow : AppAsset.downArrow,
                    height: 14,
                    color: textDarkBlue,
                    width: 14,
                  ),
          ],
        ),
      ),
    );
  }
}
