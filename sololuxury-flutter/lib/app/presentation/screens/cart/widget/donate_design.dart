import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/screens/cart/widget/donation_item.dart';

import '../../../../../all_imports.dart';

class DonateDesign extends StatelessWidget {
  const DonateDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: appTileBorderColor, width: 2),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 12,
                ),
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: const BoxDecoration(
                  color: homeBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.cartContain1.tr,
                      style: AppTextStyle.textStyleUtils600(
                          color: appColorPrimary,
                          size: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      LanguageConstants.cartContain2solo.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils300(size: 16.sp),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.donationList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return DonationItem(
                          itemData: controller.donationList[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
