import 'package:solo_luxury/all_imports.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("BRAND Binding ======");
    Get.lazyPut(() => BrandController());
  }
}
