import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:veralusso/app/main/main.common.dart';

export "package:meta_package/constants/key_value_constants.dart";

enum Environment { dev, staging, prod }

class AppConstants {
  // Network Constants

  ///Set Token
  // static String adminToken = "Bearer mhtoryghg34rvdzcz62xe8duogjq0ij9";

  //TODO:Brijesh
  static String apiEndPoint = "https://www.veralusso.com";
  static const String shipping = "/rest/V1/cmspagemanagerList/20";
  static String apiEndPointLogin = "https://www.veralusso.com";

  static String apiEndPointLogin1 = "https://www.sololuxury.com";

  //TODO:Brijesh EndPoints

  static String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/V1/categories";
  static String bannerListEndPoint = "/V1/bannerList";

  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";

  static const String faq = "/rest/V1/cmspagemanagerList/62";
  static String createOrderEndPoint = "/rest/V1/orders/create";
  static String optionsEndPoint = "/V1/products/attributes/brands/options";

  static String filteredCatProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][condition_type]=in";
  static String filteredColorProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=in";
  static String filteredBrandProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=in";
  static String filteredSizeProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][3][filters][0][condition_type]=in";

  static String filteredColorProductListEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][field]=color_v2&searchCriteria[filter_groups][2][filters][0][value]=";

  static String filteredCatProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=price&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredSizeProductListEndPoint =
      "&searchCriteria[filter_groups][3][filters][0][field]=size_v2&searchCriteria[filter_groups][3][filters][0][value]=";

  static String filteredBrandProductListEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][field]=brands&searchCriteria[filter_groups][1][filters][0][value]=";
  static String filteredPriceProductListEndPointForPriceRangeFrom =
      "&searchCriteria[filter_groups][4][filters][0][field]=price&searchCriteria[filter_groups][4][filters][0][value]=";
  static String filteredPriceProductListEndPointForPriceRangeTo =
      "&searchCriteria[filter_groups][5][filters][0][field]=price&searchCriteria[filter_groups][5][filters][0][value]=";
  static String filteredPriceFromProductListEndPoint =
      "&searchCriteria[filter_groups][4][filters][0][condition_type]=from";
  static String filteredPriceToProductListEndPoint =
      "&searchCriteria[filter_groups][5][filters][0][condition_type]=to";

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/rest/${localStore.currentCode}";
  }

  static Future dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static String productImageUrl = "$apiEndPointLogin/media/catalog/product/";

  static String apiEndPointNew2 = "https://www.brands-labels.com/rest";
  static String apiEndPointNew1 = "https://www.veralusso.com/rest/V1";
  static String apiEndPointNew3 = "https://www.brands-labels.com";
  static String apiEndPointNew = "https://www.sololuxury.com/rest/V1";

  static String apiCountryGet = "http://ip-api.com";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";

  static const String licenceId = '11434003';

  static const String apiEndPointMyTicket = "https://dev3.sololuxury.com";

  static const String fontMontserrat = 'Montserrat';

  static const String deleteCartProdyctData = "/V1/carts/mine/items/";
  static const String cartGetData = "/V1/carts/mine";

  static const String guestCreateCart = "/V1/guest-carts";
}

AndroidDeviceInfo? deviceInfoAndroid;
IosDeviceInfo? deviceInfoIos;

PackageInfo packageInfo = PackageInfo(
  appName: 'Unknown',
  packageName: 'Unknown',
  version: 'Unknown',
  buildNumber: 'Unknown',
  buildSignature: 'Unknown',
);
