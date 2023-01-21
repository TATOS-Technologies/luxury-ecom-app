import 'package:get/get.dart';
import 'package:suvandnat/app/controller/profile/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
