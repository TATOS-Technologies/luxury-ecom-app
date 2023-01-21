import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import 'widgets/privacy_widget.dart';

class PrivacyPolicyScreen extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        key: controller.scaffoldKey.value,
        appBar: commonAppbar(title: LanguageConstants.privacyPolicyText.tr),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : Padding(
                padding:  EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      LanguageConstants.policyHeadingText.tr,
                      textAlign: TextAlign.center,
                      style: AppStyle.textStyleUtils500(size: 16.sp,color: appColor
                              ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (controller.privacyPolicy != null &&
                        controller.privacyPolicy?.cmsText?.isNotEmpty == true)
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.privacyPolicy?.cmsText?.length,
                          itemBuilder: (BuildContext context, int index) {
                            CmsText? getList =
                                controller.privacyPolicy?.cmsText?[index];
                            return PrivacyWidget(getList?.title ?? '',
                                getList?.description ?? '', index + 1);
                          },
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
