import 'package:get/get.dart';
import 'package:veralusso/app/controller/influencer_registraction/influencer_registration_controller.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationController());
  }
}
