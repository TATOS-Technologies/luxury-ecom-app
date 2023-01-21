import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/donation/widget/common_container.dart';

class CharityScreen extends GetView<CharityController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.hopeText.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain1.tr,
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleUtils400(),
                ),
                const SizedBox(
                  height: 40,
                ),
                CommonContainer(
                  height: 294.h,
                  imageUrl: AppAsset.charity1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants.charityContain2.tr,
                  textAlign: TextAlign.justify,
                  style: AppStyle.textStyleUtils400(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonContainer(
                  height: 294.h,
                  imageUrl: AppAsset.charity2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  LanguageConstants.charityContain3.tr,
                  textAlign: TextAlign.justify,
                  style: AppStyle.textStyleUtils400(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  LanguageConstants.charityContain4.tr,
                  textAlign: TextAlign.justify,
                  style: AppStyle.textStyleUtils400(),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
