import 'package:solo_luxury/all_imports.dart';

class MyOrdersBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("MY ORDER Binding ======");
    Get.lazyPut(() => MyOrdersController(), fenix: true);
  }
}
