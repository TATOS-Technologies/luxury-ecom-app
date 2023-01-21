import 'package:solo_luxury/all_imports.dart';

class CharityBinding extends Bindings {
  int a = 5;
  @override
  void dependencies() {
    Get.lazyPut(() => CharityController());
  }
}
