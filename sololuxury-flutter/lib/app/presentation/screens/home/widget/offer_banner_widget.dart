import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/theme/app_asset.dart';
import 'package:solo_luxury/app/theme/colors.dart';

class OfferBannerWidget extends StatelessWidget {
  const OfferBannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85.h,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAsset.offerBanner), fit: BoxFit.cover)),
      child: Column(
        //appSubscribeButtonColor
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get up to 60% Christmas Off',
            style: AppStyle.textStyleUtils600(
                size: 20.sp, color: appSubscribeButtonColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Starting from 1 till 20 December 2022',
            style:
                AppStyle.textStyleUtils500_12(color: appSubscribeButtonColor),
          )
        ],
      ),
    );
  }
}
