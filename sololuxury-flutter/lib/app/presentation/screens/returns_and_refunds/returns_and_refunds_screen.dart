import 'package:solo_luxury/all_imports.dart';

import 'widgets/returns_and_refunds_pageview.dart';

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        appBar: commonAppbar(title: LanguageConstants.returnsRefundsText.tr),
        body: controller.getReturnsList.isEmpty
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
              ))
            : const ReturnsAndRefundsPageView(),
      ),
    );
  }
}
