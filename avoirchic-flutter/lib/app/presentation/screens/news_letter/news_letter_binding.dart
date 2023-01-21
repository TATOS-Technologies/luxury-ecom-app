import 'package:get/get.dart';

import '../../../controller/news_lettter_controller.dart';

class NewsLetterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsLetterController());
  }
}
