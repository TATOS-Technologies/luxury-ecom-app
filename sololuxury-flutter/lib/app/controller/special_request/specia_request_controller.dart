import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_ticket/create_ticket_request.dart';
import 'package:meta_package/api/services/ticket_service.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';

class SpecialRequestController extends GetxController {
  String countryCode = '1';

  bool isSubmitButtonPressed = false;
  RxBool isLoading = false.obs;
  SpecialRequestRepository specialRequestRepository =
      SpecialRequestRepository(baseUrl: AppConstants.apiEndPointLogin);

  MyTicketAPIRepository myTicketAPIRepository = MyTicketAPIRepository(
      ticketService: TicketService(AppConstants.apiEndPointLogin));

  SpecialRequestController();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    brandNameControlletr.text =
        Get.arguments[0] is String ? Get.arguments[0] as String : '';
    if (localStore.userDetail.email != null) {
      emailController.text = localStore.userDetail.email!;
      nameController.text = localStore.userDetail.firstname!;
      lastNaneController.text = localStore.userDetail.lastname!;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNaneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController brandNameControlletr = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController keywordControlle = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  bool isValidation = false;

  bool validation() {
    if (!GetUtils.isEmail(emailController.text)) {
      errorToast(LanguageConstants.enterValidEmailAddress.tr);
      return false;
    }
    return true;
  }

  Future<void> contactUsPost(context) async {
    isLoading.value = true;
    isSubmitButtonPressed = true;
    isValidation = true;
    update(["Create"]);

    try {
      if (validation()) {
        if (nameController.value.text != '' &&
            lastNaneController.value.text != '' &&
            emailController.value.text != '' &&
            phoneNumberController.value.text != '' &&
            brandNameControlletr.value.text != '' &&
            styleController.value.text != "" &&
            keywordControlle.value.text != "" &&
            imageUrlController.value.text != "" &&
            remarkController.value.text != "") {
          Map<String, dynamic> response1 =
              await myTicketAPIRepository.postCreateMyTickets(TicketForm(
            CreateTicketRequest(
                    name: nameController.value.text,
                    lastName: lastNaneController.value.text,
                    email: emailController.value.text,
                    phone: phoneNumberController.value.text,
                    brand: brandNameControlletr.value.text,
                    style: styleController.value.text,
                    keyword: keywordControlle.value.text,
                    imageUrl: imageUrlController.value.text,
                    remarks: remarkController.value.text,
                    customerId: localStore.userDetail.id.toString(),
                    langCode: localStore.currentCode,
                    ticketType: null)
                .toJson(),
          ));
          if (response1.containsKey('message')) {
            Get.toNamed<dynamic>(RoutesConstants.requestReceivedScreen);
          }
        }
      }
      isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  String getHeader() {
    return Get.arguments[1] == "brand"
        ? LanguageConstants.brandProductQuery.tr
        : LanguageConstants.categoryProductQuery.tr;
  }
}
