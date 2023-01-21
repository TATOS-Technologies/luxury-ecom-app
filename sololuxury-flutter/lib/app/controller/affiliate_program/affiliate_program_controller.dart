import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/cms_model/cms_model.dart';
import 'package:solo_luxury/all_imports.dart';

class AffiliateProgramController extends GetxController {
  String countryCode = '1';
  RxString screenTitle = "".obs;

  Rx<Color> backColor = homeBackground.obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;

  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> contactNoController = TextEditingController().obs;
  Rx<FocusNode> contactNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<FocusNode> websiteNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressOneController = TextEditingController().obs;
  Rx<FocusNode> addressOneFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressTwoController = TextEditingController().obs;
  Rx<FocusNode> addressTwoFocusNode = FocusNode().obs;

  Rx<TextEditingController> postCodeController = TextEditingController().obs;
  Rx<FocusNode> postCodeFocusNode = FocusNode().obs;

  RxString selectedVisitorValue = LanguageConstants.visitorMonthHintText.tr.obs;
  RxString selectedViewsValue = LanguageConstants.viewsMonthHintText.tr.obs;
  RxString cityValue = LanguageConstants.cityHintText.tr.obs;
  RxString countryValue = LanguageConstants.countryHintText.tr.obs;
  RxList<CmsText> affliliateListData = RxList<CmsText>();
  var isLoading = true.obs;
  final AffiliateAPIRepository affiliateAPIRepository =
      AffiliateAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  AffiliateProgramController();

  bool isSubmitButtonPressed = false;

  @override
  void onInit() {
    screenTitle.value = LanguageConstants.affiliateProgramTitleText.tr;
    super.onInit();
    getAffiliateData();
  }

  void getAffiliateData() async {
    try {
      CmsPageModel? itemsData =
          await affiliateAPIRepository.getAffiliateAPIResponse();
      if (itemsData != null) {
        affliliateListData.value = itemsData.cmsText ?? [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint("$e");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void submitButton() {
    isSubmitButtonPressed = true;
    update(["affil"]);
    if (formKey.value.currentState?.validate() ?? false) {}
  }
}
