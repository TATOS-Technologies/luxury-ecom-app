import 'package:solo_luxury/all_imports.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("BINDING=============");
    Get.lazyPut(() => CartController(), fenix: true);
    debugPrint("BINDING=============");
  }
}
