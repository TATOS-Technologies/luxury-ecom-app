import 'package:solo_luxury/all_imports.dart';

class FilterController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxBool priceClicked = true.obs;
  RxBool colorClicked = false.obs;
  RxBool brandClicked = false.obs;
  RxBool sizeClicked = false.obs;
}
