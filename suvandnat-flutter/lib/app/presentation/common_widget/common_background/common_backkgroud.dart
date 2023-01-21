// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CommonBacground extends StatelessWidget {
  final Widget child;
  CommonBacground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BGblue,
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: SvgPicture.asset(
              AppAsset.backGroundPattern,
              fit: BoxFit.cover,
              ),
            ),
            SafeArea(child: child)
          ],
        )

        // Container(
        //   decoration: const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/svg/BG_home.png'),
        //           fit: BoxFit.cover)),
        //   child: SafeArea(child: child),
        // ),
        );
  }
}
