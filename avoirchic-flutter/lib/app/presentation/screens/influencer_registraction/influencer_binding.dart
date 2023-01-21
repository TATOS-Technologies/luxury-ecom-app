import 'package:avoirchic/app/controller/influencer_registration_controller.dart';
import 'package:get/get.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationController());
  }
}
