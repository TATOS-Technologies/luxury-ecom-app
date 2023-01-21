import 'package:solo_luxury/all_imports.dart';

class TrackYourTicketEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackYourTicketEmailController());
  }
}
