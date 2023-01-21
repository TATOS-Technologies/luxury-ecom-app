// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_asset.dart';
import 'common_text_poppins.dart';

class CommonTittleWithArrow extends StatelessWidget {
  String title;
  Function()? onTap;
  CommonTittleWithArrow(this.title, {this.onTap, Key? key}) : super(key: key);

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
              title,
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
