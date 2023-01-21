import 'package:avoirchic/app/controller/refer_friend_controller.dart';
import 'package:get/get.dart';

class ReferFriendBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferFriendController());
  }
}
