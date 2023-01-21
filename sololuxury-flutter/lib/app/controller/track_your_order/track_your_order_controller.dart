import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/controller/track_your_order/track_your_ordernegative_screen.dart';

class TrackYourOrderController extends GetxController {
  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;
  RxBool isLoading = false.obs;
  TextEditingController orderNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValid = false;

  //1740027

  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  TrackYourOrderController();

  Future<void> getTrackYourOrder() async {
    isValid = true;
    debugPrint("Get getTrackYourOrder ===>");
    update(["forms"]);
    try {
      if (orderNumberController.value.text != "") {
        isLoading.value = true;
        MyOrdersData itemsData = await trackYourOrderAPIRepository
            .getTrackYourOrderApiResponse(orderNumberController.text);
        myOrdersModel.value = itemsData;
        if (myOrdersModel.value.items?.isNotEmpty ?? false) {
          Get.toNamed<dynamic>(RoutesConstants.orderDetailsScreen, arguments: [
            '',
            myOrdersModel.value.items?.first ?? MyOrdersDataItem()
          ]);
        } else {
          Get.to<dynamic>(() => const TrackYourRequestNegative());
        }
        isLoading.value = false;
        orderNumberController.clear();
        update(["forms"]);
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(
          e: e,
          callBack: (String errorMsg) {
            Get.to<dynamic>(() => const TrackYourRequestNegative());
          });
    } catch (e) {
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
