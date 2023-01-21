import 'package:brandslabels/app/core/consts/constants.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:get/get.dart';

class HomeMostPopularWidget extends StatelessWidget {
  const HomeMostPopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              LanguageConstants.mostPopular.tr,
              style: AppTextStyle.normalSemiBold18,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // View all on tap
              },
              child: Text(
                LanguageConstants.viewAll.tr,
                style: AppTextStyle.normalRegular12.copyWith(color: titleColor),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 327.w,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.grey.shade200),
                  bottom: BorderSide(color: Colors.grey.shade200),
                  right: index % 2 == 0
                      ? BorderSide(color: Colors.grey.shade200)
                      : BorderSide.none,
                  left: index % 2 == 1
                      ? BorderSide(color: Colors.grey.shade200)
                      : BorderSide.none,
                )),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                            "assets/images/home/item${index % 6}.png"),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      LanguageConstants.blueShirt.tr,
                      style: AppTextStyle.normalRegular12,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('\$ 1300', style: AppTextStyle.normalSemiBold12)
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
