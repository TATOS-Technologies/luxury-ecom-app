import 'package:solo_luxury/all_imports.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController());
  }
}
