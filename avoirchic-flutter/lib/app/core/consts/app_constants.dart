import 'package:avoirchic/app/core/config/flavor_config.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../main/main.common.dart';

enum Environment { DEV, STAGING, PROD }

class AppConstants {
  static const String deeplinkingBaseUrl = "https://avoirchic.page.link/";

  // Network Constants

  static const String baseUrlStaging = "https://www.avoir-chic.com";
  static const String baseUrlProduction = "https://www.avoir-chic.com";

  static String apiBaseUrl = FlavorConfig.instance.values.baseUrl;
  static String apiEndPoint = "";

  /* static String shipping = "/rest/V1/cmspagemanagerList/20";*/
  static String shipping = "/rest/V1/cmspagemanagerList/842";
  static String apiEndPointLogin = "https://www.avoir-chic.com";

  static String orderConfirmationEndPoint = "$apiBaseUrl/rest/V1/orders/";

  static String apiEndPointLogin1 = "https://www.sololuxury.com";

  static String apiEstimatedTime = "$apiBaseUrl/rest/V1/estimate/date-api/";
  static String specialRequest = "$apiBaseUrl/rest/V1/mytickets/create/";

  //TODO:Brijesh EndPoints
  static String login = '/rest/V1/integration/customer/token';
  static String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/V1/categories";
  static String menuEndPoint1 = "/rest/V1/categories";
  static String homePageEndPoint = "/V1/homePage";
  static String bannerListEndPoint = "/rest/V1/bannerList";
  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";
  static String paymentInformationEndPoint =
      "/V1/carts/mine/payment-information";
  static String storeWebsitesEndPoint = "/rest/V1/store/websites";
  static String storeViewsEndPoint = "/rest/V1/store/storeViews";
  static String storeConfigsEndPoint = "/rest/V1/store/storeConfigs";
  static String referFriendEndPoint = "/rest/V1/referFriend";
  static String multiAddressEndPoint = "/rest/V1/customers/me";
  static String apiEndPointContactUs = "/rest/V1/contactus";
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";
  static String filterlistEndPoint = "/rest/V1/layeredList/";
  static const String guestCreateCart = "/V1/guest-carts";
  static String optionsEndPoint = "/V1/products/attributes/brands/options";
  static String productListEndPoint =
      "/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";
  static String sortedProductListEndPoint =
      "&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=";

  static String filteredColorProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=color_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredColorProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][condition_type]=in";

  static String filteredCatProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=price&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredSizeProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=size_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredBrandProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static const String getProductDetailApi = "/V1/products/";

  static String homeBrandProductListEndPoint =
      "/rest/all/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPointForPriceRangeFrom =
      "&searchCriteria[filter_groups][1][filters][0][field]=price&searchCriteria[filter_groups][1][filters][0][value]=";

  static String filteredPriceProductListEndPointForPriceRangeTo =
      "&searchCriteria[filter_groups][2][filters][0][field]=price&searchCriteria[filter_groups][2][filters][0][value]=";

  static String filteredPriceFromProductListEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=from";

  static String filteredPriceToProductListEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=to";

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/${localStore.currentCode}/rest";
  }
  static String getDeleteUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/${localStore.currentCode}/${localStore.currentCode}/rest";
  }
  static String getGuestUrlWithCode(url) {
    return "/rest/V1/guest-carts/${localStore.guestToken}$url";
  }

  static dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static const String shippingInformation = "/shipping-information";
  static const String estimateMethods = "/estimate-shipping-methods";

  static String productImageUrl = "$apiBaseUrl/media/catalog/product/";

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://solo_luxury.virtual-manager-backend.ml";
  static String imageEndPoint = "https://solo_luxury.s3.amazonaws.com/";
  static String createOrderEndPoint = "/rest/V1/orders/create";
  static const String getChooseInOptionApi =
      "/rest/all/V1/products/attributes/size_v2/options/";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";

  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";

  static String jsonEndPoint = "/json";
  static String recommendedProductsEndPoint = "/V1/recommendedList?sku=";
  static String apiEndPointNew2 = "https://www.avoir-chic.com/rest";

  static String notifyMe = '/V1/stocknotifyme';

  static String forgetPassword = '/V1/customers/password';
  static String forgetPasswordEndPoint = 'https://dev2.brands-labels.com';

  //static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  // static String apiEndPoint = "https://api.solo_luxury.com";
  static String apiEndPointNew = "https://www.sololuxury.com/rest/V1";
  static String apiEndPointNew3 = "https://www.brands-labels.com";
  static String apiCountryGet = "http://ip-api.com";

  static const String getSizeListApi = "/rest/V1/sizeList/";

  static const String licenceId = '11434003';

  static String addAddress = '/rest/V1/customers/me';
  static String countryList = '/rest/V1/directory/countries';
  static String createMyTicket = '/rest/V1/mytickets/create/';

  static const String contactUs = "/rest/V1/contactus";
  static const String fullContactUs =
      "https://www.sololuxury.com/rest/V1/contactus";
  static const String wishList = "/V1/wishlist";
  static const String brandList = "/rest/V1/brandList";
  static const String faq = "rest/V1/cmspagemanagerList/856";

  /*static const String faq = "/rest/V1/cmspagemanagerList/16";*/
  static const String myOrders =
      "/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=";
  static const String deleteWishlist = "/V1/wishlist/";
  static const String postWishlist = "/V1/wishlist/";

  static const String fontPoppins = 'Poppins';

  static String myTicketApi = '/rest/V1/mytickets/';
  static String ticketApi =
      'https://erp.theluxuryunlimited.com/api/ticket/send';
  static String speiclaSizeApi = '/V1/notifyMe';

  static String signup = '/user';
  static const String deleteCartProdyctData = "/V1/carts/mine/items/";
  static const String cartGetData = "/V1/carts/mine";
  static const String donationGetData = "/rest/V1/donation/list";
  static const String addTocartData = "/V1/carts/mine/items";
  static const String addTocartData2 = "/rest/in-en/V1/carts/mine/items";
  static const String createCart = "/V1/carts/mine/";

  static String privacyPolicyApi = '/rest/in-en/V1/cmspagemanagerList/845';

  static String termAndConditionApi = '/rest/V1/cmspagemanagerList/855';
  static const String addressList = "/rest/V1/customers/me";
  static const String couponsCode =
      "/rest/V1/coupons/search?searchCriteria[filter_groups][0][filters][0][field]=type&searchCriteria[filter_groups][0][filters][0][value]=0&searchCriteria[filter_groups][0][filters][0][condition_type]=equal";
  static String addWishList = '/V1/wishlist/';
  static String brandListApi = '/rest/V1/brandList';
  static const String guestOrderApi = "/V1/guest-carts/";
  static String returnReasonApi = '/rest/V1/orderReturnList/';
  static String postReturnReasonApi = '/V1/orderReturn';
  static String orderTrakingApi = '/rest/V1/orderTrackingList/';
  static String storeCreditApi = '/rest/V1/store/credits/balance/';
  static String cancellationApi = '/rest/V1/order/cancellation/';
  static String cancellationItemApi = '/rest/V1/orderItem/cancellation/';
  static String returnReasonStatusApi = '/rest/V1/returnStatus';
  static String returnOrderApi = '/rest/V1/order/return/';
  static String returnOrderItemApi = '/rest/V1/orderItem/return';
  static String cancelReasonApi = '/rest/V1/order/cancellation/reasons';
  static String myTrackTicket = '/rest/V1/mytickets/byEmail/';
  static const String getTotals = "/V1/carts/mine/totals";
  static const String guestGetTotals = "/V1/guest-carts/";
  static const String addCouponsCodeToCart = "/V1/carts/mine/coupons/";
  static const String addGuestCouponsCodeToCart = "/V1/guest-carts/";
  static const String deleteCoupons = "/V1/carts/mine/coupons";
  static const String deleteGuestCoupons = "/V1/guest-carts/";
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
