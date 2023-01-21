import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/faq/widget/page_view.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        appBar: commonAppbar(title: LanguageConstants.faqText.tr),
        body: controller.getFaqList.isEmpty
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                  // size: 50.0,
                ),
              )
            : const CommonPageView(),
      ),
    );
  }
}
