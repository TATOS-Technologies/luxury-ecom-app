import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class OthersViewTheseWidget extends StatelessWidget {
  const OthersViewTheseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Text(LanguageConstants.othersViewThis.tr,
                  style: AppStyle.textStyleUtils600(size: 18.w, color: appColorButton)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    //Whatsnew view all button
                  },
                  child: Text(
                    LanguageConstants.viewAll.tr,
                    style: AppStyle.textStyleUtils500_12(color: appColorButton),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        SizedBox(
          height: 200.w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.w),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140.w,
                      width: 248.w,
                      padding: EdgeInsets.all(20.w),
                      decoration:
                          BoxDecoration(color: productBG, borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(AppAsset.productItem),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      LanguageConstants.blueShirt.tr,
                      style: AppStyle.textStyleUtils500(size: 12.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '\$ 1300',
                      style: AppStyle.textStyleUtils600(size: 12.sp),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Divider(color: brownF3E5DE, thickness: 1.w),
      ],
    );
  }
}
