import 'package:solo_luxury/all_imports.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("HOME Binding ======");
    Get.lazyPut(() => HomeController());

    debugPrint("BINDING=============");
  }
}
