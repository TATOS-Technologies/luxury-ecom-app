// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

import '../../../../theme/app_asset.dart';

class HomeTextBanner extends StatelessWidget {
  final bool holeIsLeft;
  final String text;

  const HomeTextBanner({
    Key? key,
    required this.holeIsLeft,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 327.w,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.w),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    holeIsLeft
                        ? AppAsset.leftHoldContainer
                        : AppAsset.rightHoldContainer,
                  ),
                  fit: BoxFit.fitWidth)),
          child: Center(
            child: SizedBox(
                width: 280.w,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(
                    color: Colors.white,
                  ),
                )),
          ),
        ));
  }
}
