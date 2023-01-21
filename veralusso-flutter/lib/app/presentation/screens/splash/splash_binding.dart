import 'package:get/get.dart';
import 'package:veralusso/app/controller/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
