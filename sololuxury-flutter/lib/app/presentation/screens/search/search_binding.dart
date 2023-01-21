import 'package:solo_luxury/all_imports.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    debugPrint("SEARCH Binding ======");
    Get.lazyPut(() => SearchController());
    debugPrint("SEARCH Binding ======");
  }
}
