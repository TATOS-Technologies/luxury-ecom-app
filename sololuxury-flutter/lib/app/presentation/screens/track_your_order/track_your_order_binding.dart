import 'package:solo_luxury/all_imports.dart';

class TrackYourOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackYourOrderController());
  }
}
