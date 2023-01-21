import 'package:brandslabels/app/controller/news_lettter_controller.dart';
import 'package:get/get.dart';

class NewsLetterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsLetterController());
  }
}
