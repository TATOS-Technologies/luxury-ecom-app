import 'package:solo_luxury/all_imports.dart';

class AddressBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressBookController());
  }
}
