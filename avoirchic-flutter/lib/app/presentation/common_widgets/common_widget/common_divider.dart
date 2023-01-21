import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CommonDivider extends StatelessWidget {
  final double? width;

  const CommonDivider({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      color: borderGrey,
      height: 1.0,
    );
  }
}
