import 'package:solo_luxury/all_imports.dart';

import 'widgets/shipping_pageview.dart';

class ShippingScreen extends GetView<ShippingController> {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(
        title: LanguageConstants.shipping.tr,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appColor,
                ),
              )
            : const ShippingPageView(),
      ),
    );
  }
}
