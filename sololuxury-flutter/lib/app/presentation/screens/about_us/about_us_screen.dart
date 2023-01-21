import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.aboutUsText.tr),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                LanguageConstants.aboutUsContain1solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain2solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain3solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain4solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain5solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain6solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.aboutUsContain7solo.tr,
                textAlign: TextAlign.left,
                style: AppTextStyle.textStyleUtils400(size: 12.sp),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
