import 'package:solo_luxury/all_imports.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("PROFILE Binding ======");
    Get.lazyPut(() => ProfileController());
  }
}
