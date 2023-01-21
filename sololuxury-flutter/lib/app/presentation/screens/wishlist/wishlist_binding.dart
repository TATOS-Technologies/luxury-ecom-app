import 'package:solo_luxury/all_imports.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {
    debugPrint("WISHLIST Binding ======");
    Get.lazyPut(() => WishlistController());
  }
}
