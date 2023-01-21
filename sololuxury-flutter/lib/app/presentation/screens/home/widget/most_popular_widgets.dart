import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(LanguageConstants.mostPopular.tr,
                  style: AppStyle.textStyleUtils600(size: 18.w, color: appColorButton)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    //trending view all button
                  },
                  child: Text(
                    LanguageConstants.viewAll.tr,
                    style: AppStyle.textStyleUtils500_12(color: appColorButton),
                  )),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .8),
              itemBuilder: (context, index) {
                //trending product tile
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 148.w,
                        width: 156.w,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: productBG, borderRadius: BorderRadius.circular(20)),
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
          )
        ],
      ),
    );
  }
}
