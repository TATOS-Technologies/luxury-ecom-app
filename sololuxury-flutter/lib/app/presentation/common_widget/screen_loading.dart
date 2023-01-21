import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Container(
        alignment: Alignment.center,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: const SpinKitThreeBounce(
            color: appColor,
          ),
        ),
      ),
    );
  }
}
