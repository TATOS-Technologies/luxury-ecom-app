import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/affiliate_program/widget/affiliate_item.dart';

class AffiliateProgramScreen extends GetView<AffiliateProgramController> {
  const AffiliateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar:
              commonAppbar(title: LanguageConstants.affiliateProgramText.tr),
          backgroundColor: homeBackground,
          body: controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                  color: appColor,
                ))
              : SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: HeadlineBodyOneBaseWidget(
                            title: controller.screenTitle.value,
                            titleColor: Colors.black,
                            titleTextAlign: TextAlign.center,
                            underline: true,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        controller.affliliateListData.isNotEmpty
                            ? ListView.separated(
                                itemCount: controller.affliliateListData.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                itemBuilder: (context, index) {
                                  return AffiliateItem(
                                    affiliateData:
                                        controller.affliliateListData[index],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 10),
                              )
                            : Text(
                                LanguageConstants.noDataFound.tr,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.normalRegular14,
                              ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
