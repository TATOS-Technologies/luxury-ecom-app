import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';

class NewsLetterController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final List<String> imgList = [
    LanguageConstants.changeTHEWORLDWithYourPurchaseText.tr,
  ];
}
