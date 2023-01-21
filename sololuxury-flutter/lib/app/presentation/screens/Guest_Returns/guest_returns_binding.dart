import 'package:solo_luxury/all_imports.dart';

class GuestReturnsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestReturnsController());
  }
}
