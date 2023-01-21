import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/guest_order_track/guest_order_track.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';

import 'dart:developer';

import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';

import 'package:solo_luxury/all_imports.dart';

import '../track_your_order/track_your_ordernegative_screen.dart';

class GuestReturnsController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController orderIdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confrmEmailController = TextEditingController();
  TextEditingController subscribeEmailController = TextEditingController();
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxBool isLoading = false.obs;
  TextEditingController billingLastnameController = TextEditingController();

  RxBool isValid = false.obs;

  Rx<MyOrdersData> myOrdersModel = MyOrdersData().obs;

  Rx<MyOrdersDataItem> myOrdersItems = MyOrdersDataItem().obs;

  Future<void> subscribeNewsLetter(String email) async {
    isLoading.value = true;
    try {
      final response =
          await newsletterAPIRepository.subscribeNewsLetter(email: email);
      if (response.message != null && response.message != '') {
        subscribeEmailController.text = "";
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: CommonTextPoppins(
              response.message.toString(),
            ),
          ),
        );
      }
      log('', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    isLoading.value = false;
  }

  final TrackYourOrderAPIRepository trackYourOrderAPIRepository =
      TrackYourOrderAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  Future<void> getGuestTrackYourOrder() async {
    isValid.value = true;
    debugPrint("Get getTrackYourOrder ===>");
    update(["forms"]);
    try {
      if (orderIdController.value.text != "") {
        MyOrdersDataItem itemsData = await trackYourOrderAPIRepository
            .getGuestTrackYourOrderApiResponse(GuestOrderForm(GuestOrderRequest(
                    orderId: orderIdController.text,
                    billingLastName: billingLastnameController.text,
                    type: "email",
                    email: emailController.text)
                .toJson()));

        myOrdersItems.value = itemsData;
        isValid.value = false;
        if (myOrdersItems.value.incrementId != null) {
          Get.toNamed<dynamic>(RoutesConstants.orderDetailsScreen,
              arguments: ['', myOrdersItems.value]);
        } else {
          Get.to<dynamic>(() => const TrackYourRequestNegative());
        }
        orderIdController.clear();
        billingLastnameController.clear();
        emailController.clear();
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
      isValid.value = false;
    }
  }
}
