import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/controller/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(() => SafeArea(
          child: Scaffold(
            key: controller.scaffoldKey.value,
            body: Container(
              height: mq.height,
              width: mq.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(AppAsset.logo,
                  height: mq.height * 0.25, width: mq.width * 0.5),
            ),
          ),
        ));
  }
}
