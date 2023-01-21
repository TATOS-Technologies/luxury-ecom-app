import 'dart:ui';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/influencer_registraction/widget/influencer_design.dart';

class InfluencerRegistrationScreen
    extends GetView<InfluencerRegistrationController> {
  const InfluencerRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: commonAppbar(
            title: LanguageConstants.influencerRegistrationText.tr),
        backgroundColor: homeBackground,
        body: controller.isLoading.value
            ? Center(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: const SpinKitThreeBounce(
                        color: appColor,
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: homeBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const InfluencerDesign(),
                ),
              ),
      ),
    );
  }
}
