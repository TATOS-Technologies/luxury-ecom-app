import 'package:brandslabels/app/controller/wishlist_controller.dart';
import 'package:get/get.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController(), fenix: true);
  }
}
