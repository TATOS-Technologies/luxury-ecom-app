import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_poppins.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomwButtonListWidget extends StatelessWidget {
  const HomwButtonListWidget({
    Key? key,
  }) : super(key: key);

  static List<String> buttonName = ['Men', 'women', 'Kids', 'Home'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.w),
        child: Row(
          children: List.generate(4, (index) {
            return SizedBox(
              height: 30.w,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.only(left: index == 0 ? 24.w : 13.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: whiteColor),
                  child: CommonTextPoppins(
                    buttonName[index],
                    color: blackColor,
                    fontSize: 12.sp,
                  ),
                  onPressed: () {},
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
