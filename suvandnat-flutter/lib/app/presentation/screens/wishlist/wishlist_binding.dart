import 'package:get/get.dart';
import 'package:suvandnat/app/controller/wishlist/wishlist_controller.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController(), fenix: true);
  }
}
