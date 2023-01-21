import 'package:get/get.dart';
import 'package:suvandnat/app/controller/influencer_registraction/influencer_registration_controller.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationController());
  }
}
