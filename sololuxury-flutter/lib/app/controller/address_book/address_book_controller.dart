import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:solo_luxury/all_imports.dart';

class AddressBookController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  AddressAPIRepository addressListAPIRepository = AddressAPIRepository(
      addressService: AddAddressService(AppConstants.apiEndPointLogin));
  String? countryCode;
  RxBool isLoading = true.obs;
  RxBool isDefaultLoading = false.obs;
  Rx<MyAccountDetails> getAdressList = MyAccountDetails().obs;

  AddressBookController({this.countryCode});

  @override
  void onInit() {
    getAddressList();
    super.onInit();
  }

  Future<void> getAddressList() async {
    isLoading.value = true;
    try {
      final MyAccountDetails? data =
          await addressListAPIRepository.getAddressListResponse();
      if (data != null) {
        getAdressList.value = data;
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    isLoading.value = false;
  }

  Future<void> addAddress() async {
    isDefaultLoading.value = true;
    debugPrint("Adding Address");
    addressListAPIRepository.addAddress(getAdressList);
    isDefaultLoading.value = false;
  }

  Future<void> addressOnTap(Address? address) async {
    dynamic result = await Get.toNamed<dynamic>(RoutesConstants.addAdressScreen,
        arguments: [getAdressList.value, address, 1]);
    if (result != null && result is bool && result) {
      getAddressList();
    }
  }

  Future<void> deleteAddressOnTap(Address? address) async {
    getAdressList.value.addresses
        ?.removeWhere((element) => element.id == address?.id);
    addAddress();
  }

  Future<void> billingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultBilling != null) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultBilling ?? '0'))
          .defaultBilling = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultBilling = !(address?.defaultBilling ?? false);
    addAddress();
  }

  Future<void> shippingCheckButtonOnTap(Address? address) async {
    if (getAdressList.value.defaultShipping != null) {
      getAdressList.value.addresses
          ?.firstWhere((element) =>
              element.id ==
              int.parse(getAdressList.value.defaultShipping ?? '0'))
          .defaultShipping = false;
    }
    getAdressList.value.addresses
        ?.firstWhere((element) => element.id == address?.id)
        .defaultShipping = !(address?.defaultShipping ?? false);
    addAddress();
  }
}
