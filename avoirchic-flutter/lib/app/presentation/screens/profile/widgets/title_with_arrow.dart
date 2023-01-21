import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/profile_controller.dart';
import '../../../../theme/app_asset.dart';
import '../../../common_widgets/common_widget/common_text_poppins.dart';

class TitleWithArrow extends GetView<ProfileController> {
  final String? title;
  final VoidCallback? onTap;

  const TitleWithArrow(this.title, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextPoppins(
              title ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: Center(
                child: SvgPicture.asset(
                  AppAsset.rightIcon,
                  height: 10.0,
                  width: 10.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
