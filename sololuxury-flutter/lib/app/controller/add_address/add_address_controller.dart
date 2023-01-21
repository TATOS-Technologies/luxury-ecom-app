import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/customphonefield/countries.dart';

class AddAddressController extends GetxController {
  RxString countryCodeNumber = '1'.obs;
  RxString phoneErrorMsg = "".obs;
  RxInt index = 0.obs;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController zipPovinceController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  RxList<CountryListModel> getcountryList = RxList<CountryListModel>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidation = false;
  Rx<CountryListModel> selectedCoutry = CountryListModel().obs;
  Rx<AvailableRegion> selectedState = AvailableRegion().obs;
  MyAccountDetails getAddressList = Get.arguments[0] as MyAccountDetails;

  Rx<Address> getUpdateAddressList = Address().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = false.obs;
  RxBool isScreenLoading = false.obs;
  String addressId = '';
  CountryController countryController = Get.find<CountryController>();

  String? addressType =
      ((Get.arguments is List) && (Get.arguments as List).length == 4)
          ? Get.arguments[3] as String?
          : null;

  AddAddressController({this.countryCode});

  @override
  void onInit() {
    getCountryList();
    countryCodeNumber.value = countries
        .firstWhere((country) => country.code == countryController.countryCode)
        .dialCode;
    super.onInit();
  }

  Future<void> getCountryList() async {
    try {
      List<CountryListModel>? countryList =
          await addressListAPIRepository.getCountryListResponse();

      if (countryList?.isNotEmpty == true) {
        getcountryList.value = countryList!;
        getcountryList.removeWhere(
            (element) => (element.fullNameEnglish?.isEmpty ?? true));
      }
      getUpdateOrNot();
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }

  void getUpdateOrNot() {
    isLoading.value = true;
    if (Get.arguments[2] == 1) {
      getUpdateAddressList.value = Get.arguments[1] as Address;
      addressId = getUpdateAddressList.value.id.toString();

      firstNameController.text = getUpdateAddressList.value.firstname ?? '';
      lastNameController.text = getUpdateAddressList.value.lastname ?? '';
      phoneNumberController.text = getUpdateAddressList.value.telephone ?? '';
      zipPovinceController.text = getUpdateAddressList.value.postcode ?? '';
      address1Controller.text = getUpdateAddressList.value.street?.first ?? '';
      address2Controller.text = getUpdateAddressList.value.street?[1] ?? '';
      cityController.text = getUpdateAddressList.value.city ?? '';
      for (var i in getcountryList) {
        if (i.id.toString() ==
            getUpdateAddressList.value.countryId?.toString()) {
          selectedCoutry.value = i;
          for (var j in (selectedCoutry.value.availableRegions ?? [])) {
            if (j.id.toString() ==
                (getUpdateAddressList.value.region?.regionId ?? '')
                    .toString()) {
              selectedState.value = AvailableRegion(
                code: getUpdateAddressList.value.region?.regionCode ?? '',
                id: getUpdateAddressList.value.region?.regionId?.toString() ??
                    '',
                name: getUpdateAddressList.value.region?.region ?? '',
              );
            }
          }
        }
      }
    }
    isLoading.value = false;
  }

//Api Calling
  Future<void> addAddress(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState?.validate() ?? false) {
      isScreenLoading.value = true;
      if (phoneNumberController.text.isEmpty) {
        phoneErrorMsg.value = LanguageConstants.phoneNumberIsRequired.tr;
      } else {
        phoneErrorMsg.value = "";
      }
      debugPrint('Phone ---- ${phoneNumberController.text}');
      debugPrint('Phone country ---- ${selectedCoutry.value.toJson()}');
      if (selectedCoutry.value.id != null) {
        try {
          await addressListAPIRepository.addNewAddress(
              getAddressList,
              AddAddressRequest(
                  region: Region(
                      regionCode: selectedState.value.code,
                      region: selectedState.value.name,
                      regionId: int.parse(selectedState.value.id ?? "0")),
                  countryId: selectedCoutry.value.id.toString(),
                  street: [
                    (address1Controller.text),
                    (address2Controller.text)
                  ],
                  firstname: firstNameController.text,
                  lastname: lastNameController.text,
                  telephone:
                      "+${countryCodeNumber.value}${phoneNumberController.text}",
                  postcode: zipPovinceController.text,
                  city: cityController.text,
                  defaultShipping:
                      addressType != null ? addressType == 'shipping' : false,
                  defaultBilling:
                      addressType != null ? addressType == 'billing' : false));
          Get.back(result: true);
        } on ApiException catch (e) {
          ExceptionHandler.apiExceptionError(e: e);
        } catch (e) {
          debugPrint(e.toString());
          ExceptionHandler.appCatchError(error: e);
        }
      } else {
        Get.snackbar(LanguageConstants.warning.tr,
            '${LanguageConstants.countryText.tr} ${LanguageConstants.requiredVal.tr}');
      }
      isScreenLoading.value = false;
    }
  }

  Future<void> updateAddress(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if ((formKey.currentState?.validate() ?? false) &&
        selectedCoutry.value.id != null) {
      try {
        isScreenLoading.value = true;
        MyAccountDetails? address =
            await addressListAPIRepository.updateAddress(
                getAddressList,
                AddAddressRequest(
                  region: Region(
                      regionCode: selectedState.value.code,
                      region: selectedState.value.name,
                      regionId: int.parse(selectedState.value.id ?? "0")),
                  countryId: selectedCoutry.value.id.toString(),
                  street: [
                    (address1Controller.text),
                    (address2Controller.text)
                  ],
                  firstname: firstNameController.text,
                  lastname: lastNameController.text,
                  telephone: phoneNumberController.text,
                  postcode: zipPovinceController.text,
                  city: cityController.text,
                ),
                addressId);
        isScreenLoading.value = false;
        if (address != null) {
          Get.back(result: true);
        }
      } on ApiException catch (e) {
        ExceptionHandler.apiExceptionError(e: e);
      } catch (e) {
        debugPrint("Error $e");
        ExceptionHandler.appCatchError(error: e);
      }
    } else {
      Get.snackbar(LanguageConstants.warning.tr,
          '${LanguageConstants.countryText.tr} ${LanguageConstants.requiredVal.tr}');
    }
  }
}
