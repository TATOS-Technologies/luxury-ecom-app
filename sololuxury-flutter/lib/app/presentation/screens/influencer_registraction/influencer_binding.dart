import 'package:solo_luxury/all_imports.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationController());
  }
}
