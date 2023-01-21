import 'dart:ui';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/widget/check_out.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  final dynamic cartlist = Get.arguments;

  CheckoutOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldkey,
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.checkOutText.tr),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40.0),
              child: Form(
                key: controller.formKey,
                child: const CheckOut(),
              ),
            ),
            controller.isLoading.value
                ? AbsorbPointer(
                    absorbing: true,
                    child: Center(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: const SpinKitThreeBounce(
                          color: appColor,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
