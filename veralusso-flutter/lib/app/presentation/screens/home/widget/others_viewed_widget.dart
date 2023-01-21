import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:veralusso/app/core/const/common_constant_imports.dart';
import 'package:meta_package/meta_package.dart';
import 'package:get/get.dart';

class OthersViewedWidget extends StatelessWidget {
  const OthersViewedWidget({
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
                  style: AppStyle.textStyleUtils600(
                      size: 18.w, color: Colors.black)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    //Whatsnew view all button
                  },
                  child: Text(
                    LanguageConstants.viewAll.tr,
                    style: AppStyle.commonTextStyle500(
                        size: 12.w, color: Colors.black),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 10.w,
        ),
        SizedBox(
          height: 178.w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.w),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 132.w,
                      width: 132.w,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('assets/images/bag${index % 4}.png'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      LanguageConstants.blueShirt.tr,
                      style: AppStyle.textStyleUtils600(
                          size: 12.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '\$ 1300',
                      style: AppStyle.textStyleUtils600(
                          size: 12.sp, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
