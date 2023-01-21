import 'package:solo_luxury/all_imports.dart';

class InfluencerRegistrationThankyouBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationThankyouController());
  }
}
