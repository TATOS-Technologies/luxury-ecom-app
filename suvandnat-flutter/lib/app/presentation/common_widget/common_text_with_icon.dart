// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_asset.dart';
import '../../theme/colors.dart';

class CommonTextWithIcon extends StatelessWidget {
  String? name;
  TextStyle? style;
  bool? isIcon = false;
  bool? isExpand = false;
  GestureTapCallback? onTapExpand;
  GestureTapCallback? onTapCollapse;
  CommonTextWithIcon(
      {this.name,
      this.style,
      this.isIcon,
      this.isExpand,
      this.onTapExpand,
      this.onTapCollapse,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isExpand! ? onTapExpand : onTapCollapse,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name!, overflow: TextOverflow.ellipsis, style: style),
            isIcon!
                ? Container()
                : SvgPicture.asset(
                    !isExpand! ? AppAsset.rightArrow : AppAsset.downArrow,
                    color: !isExpand! ? Colors.black : appColorPrimary,
                  ),
          ],
        ),
      ),
    );
  }
}
