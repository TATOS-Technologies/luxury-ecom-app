import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/contact_us_request/contact_us_request.dart';
import 'package:meta_package/utils/validator.dart';
import 'package:solo_luxury/all_imports.dart';

class ContactUsController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  ContactUsController();

  RxBool isLoading = false.obs;
  RxString chosenValue = LanguageConstants.typeOfEnquiryText.tr.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<TextEditingController> surnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> confirmEmailController =
      TextEditingController().obs;
  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> onyourmindController = TextEditingController().obs;
  bool isSubmitButtonPressed = false;
  String countryCode = '1';
  RxString chosenCountry = ''.obs;
  final CountryController countryController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> data = [
    LanguageConstants.typeOfEnquiryText.tr,
    LanguageConstants.deliveryText.tr,
    LanguageConstants.ordersText.tr,
    LanguageConstants.paymentText.tr,
    LanguageConstants.productText.tr,
    LanguageConstants.promotionText.tr,
    LanguageConstants.returnsContactText.tr,
    LanguageConstants.shippingText.tr,
    LanguageConstants.technicalText.tr,
  ];

  RxList<ContactUsResponseModel> getRersponse =
      RxList<ContactUsResponseModel>();

  @override
  Future<void> onInit() async {
    super.onInit();
    chosenCountry.value = countryController.storeWebsitesList
            .firstWhere((element) =>
                element.websiteId.toString() == localStore.websiteId)
            .name ??
        '';
  }

  void contactUsPost(context) async {
    isSubmitButtonPressed = true;
    update();
    try {
      if ((formKey.currentState?.validate() ?? false) && validation()) {
        isLoading.value = true;
        List<ContactUsResponseModel> response = (await aboutAPIRepository
            .getContactUsApiData(ContactUsForm(ContactUsRequest(
                    name: nameController.value.text,
                    lastName: surnameController.value.text,
                    email: emailController.value.text,
                    subject: subjectController.value.text,
                    orderNo: '10000',
                    phone: "+$countryCode${phoneController.value.text}",
                    typeOfInquiry: chosenValue.value,
                    country: chosenCountry.value,
                    sourceOfTicket: 'mobile',
                    message: onyourmindController.value.text)
                .toJson())));
        debugPrint("contactUsResponseModel -> $response");
        isLoading.value = false;
        if (response.isNotEmpty == true) {
          getRersponse.value = response;
        }
        if (getRersponse.isNotEmpty) {
          Get.toNamed<dynamic>(RoutesConstants.contactUsSubmissionScreen);
        }
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }

  bool validation() {
    if (chosenValue.isEmpty) {
      errorToast(LanguageConstants.typeOfEnquiryText.tr +
          LanguageConstants.requiredVal.tr);
      return false;
    }
    return true;
  }
}
