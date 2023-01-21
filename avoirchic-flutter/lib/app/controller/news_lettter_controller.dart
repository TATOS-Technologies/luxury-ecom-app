import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class NewsLetterController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final List<String> imgList = [
    LanguageConstants.changeTHEWORLDWithYourPurchaseText.tr,
  ];
}
