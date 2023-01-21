import 'package:solo_luxury/all_imports.dart';

class AddAddressPopUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAddressPopUpController());
  }
}
