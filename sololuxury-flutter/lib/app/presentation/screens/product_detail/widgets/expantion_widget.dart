
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class ExpantionWidget extends StatelessWidget {
  final String title;
  Widget child;

  ExpantionWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColorButton2,
          border: Border.all(color: appTileBorderColor)),
      child: ExpansionTile(
        iconColor: appColorButton,
        title: CommonTextPoppins(
          title,
          color: appColorButton,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        children: [
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: homeBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              padding: EdgeInsets.all(30.w),
              child: child),
        ],
      ),
    );
  }
}