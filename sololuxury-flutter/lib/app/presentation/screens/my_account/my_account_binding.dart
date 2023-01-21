import 'package:solo_luxury/all_imports.dart';

class MyAccountBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("MY ACCOUNT Binding ======");
    Get.lazyPut(() => MyAccountController());
  }
}
