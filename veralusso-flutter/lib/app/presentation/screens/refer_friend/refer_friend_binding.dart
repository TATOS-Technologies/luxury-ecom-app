import 'package:get/get.dart';
import 'package:veralusso/app/controller/refer_friend/refer_friend_controller.dart';

class ReferFriendBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReferFriendController());
  }
}
