import 'package:solo_luxury/all_imports.dart';

import '../../../../gen/assets.gen.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Container(
            height: mq.height,
            width: mq.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: controller.backgroundColorValue.value,
            ),
            child: Assets.icon.appIcon
                .image(height: mq.height * 0.25, width: mq.width * 0.5),
          ),
        ),
      ),
    );
  }
}
