import 'package:solo_luxury/all_imports.dart';

class ReferFriendBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferFriendController());
  }
}
