import 'package:get/get.dart';
import 'package:veralusso/app/controller/news_letter/news_lettter_controller.dart';

class NewsLetterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsLetterController());
  }
}
