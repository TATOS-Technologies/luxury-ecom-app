import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:suvandnat/app/core/config/flavor_config.dart';
import 'package:suvandnat/app/main/main.common.dart';

enum Environment { dev, staging, prod }

class AppConstants {
  static const String deeplinkBaseUrl = "suvandnat.page.link";

  // Network Constants
  static const String baseUrlProduction = "https://www.suvandnat.com";
  static const String baseUrlStaging = "https://www.suvandnat.com";

  static String apiBaseUrl = FlavorConfig.instance.values.baseUrl;

  static String apiEndPointLogin = FlavorConfig.instance.values.baseUrl;
  static String apiEndPointLogin1 = "https://www.sololuxury.com";

  // static String adminToken = EnvSecretConfigs.instance.adminToken;
  static String ticketApi =
      'https://erp.theluxuryunlimited.com/api/ticket/send';

  static String login = '/rest/V1/integration/customer/token';
  static String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/V1/categories";
  static String homeMenuEndPoint = "/V1/homepagemanagerList";
  static String menuEndPoint1 = "/rest/V1/categories";
  static String homePageEndPoint = "/rest/V1/homePage";
  static String bannerListEndPoint = "/V1/bannerList";
  static String estimatesShippingMethodEndPoint =
      "/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/V1/carts/mine/shipping-information";

  // static String fullContactUs = "https://www.suvandnat.com/rest/V1/contactus";
  static String fullContactUsEndpoint = "$apiBaseUrl/rest/V1/contactus";
  static String specialRequest = "$apiBaseUrl/rest/V1/mytickets/create/";

  // static String apiEstimatedTime = "https://www.suvandnat.com/rest/V1/estimate/date-api/";
  static String apiEstimatedTimeEndpoint =
      "$apiBaseUrl/rest/V1/estimate/date-api/";

  static String shipping = "/rest/V1/cmspagemanagerList/20";
  static const String donationGetData = "/rest/V1/donation/list";
  static String createOrderEndPoint = "/rest/V1/orders/create";
  static String storeWebsitesEndPoint = "/rest/V1/store/websites";
  static String storeViewsEndPoint = "/rest/V1/store/storeViews";
  static String storeConfigsEndPoint = "/rest/V1/store/storeConfigs";
  static String referFriendEndPoint = "/rest/V1/referFriend";
  static String multiAddressEndPoint = "/rest/V1/customers/me";
  static String apiEndPointContactUs = "/rest/V1/contactus";

  /*static const String faq = "/rest/V1/cmspagemanagerList/16";*/
  static const String faq = "/rest/V1/cmspagemanagerList/17";
  static const String getChooseInOptionApi =
      "/rest/all/V1/products/attributes/size_v2/options/";
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";

  static String filterDataApi = '/rest/V1/layeredList/';

  static String optionsEndPoint = "/V1/products/attributes/brands/options";

  static String productListEndPoint =
      "/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String sortedProductListEndPoint =
      "&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=";

  static String filteredColorProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=color_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredCatProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredPriceProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=price&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredSizeProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=size_v2&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredBrandProductListEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static String homeBrandProductListEndPoint =
      "/rest/all/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static String filteredCatProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][condition_type]=in";

  static String filteredColorProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=in";

  static String filteredSizeProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][3][filters][0][condition_type]=in";

  static String filteredBrandProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=in";

  static String filteredPriceProductListEndPointForPriceRangeFrom =
      "&searchCriteria[filter_groups][1][filters][0][field]=price&searchCriteria[filter_groups][1][filters][0][value]=";

  static String filteredPriceFromProductListEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=from";

  static String filteredPriceProductListEndPointForPriceRangeTo =
      "&searchCriteria[filter_groups][2][filters][0][field]=price&searchCriteria[filter_groups][2][filters][0][value]=";

  static String filteredPriceToProductListEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=to";

  static const String getProductDetailApi = "/V1/products/";

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/rest/${localStore.currentCode}";
  }

  static String getGuestUrlWithCode(String url) {
    return "/rest/V1/guest-carts/" + localStore.guestToken + url;
  }

  static dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static const String shippingInformation = "/shipping-information";
  static const String estimateMethods = "/estimate-shipping-methods";
  static String paymentInformationEndPoint =
      "/V1/carts/mine/payment-information";

  static String productImageUrl = "$apiEndPointLogin/media/catalog/product";

  // static const String cartToken = "Bearer nobx0cflmvoyogseybh6cdyknvvv58ic";
  static const String cartGetData = "/V1/carts/mine";
  static const String deleteCartProdyctData = "/V1/carts/mine/items/";
  static const String deleteCartProdyctData2 = "/V1/carts/mine/items/";
  static const String addTocartData = "/V1/carts/mine/items";
  static const String addTocartData2 = "/V1/carts/mine/items";
  static const String createCart = "/V1/carts/mine/";

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://suvandnat.virtual-manager-backend.ml";
  static String imageEndPoint = "https://suvandnat.s3.amazonaws.com/";

  // static String menuEndPoint = "/categories";
  // static String estimatesShippingMethodEndPoint = "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint = "/in-en/V1/carts/mine/shipping-information";
  // static String multiAddressEndPoint = "/V1/customers/me";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String referFriendEndPoint = "/referFriend";

  static String jsonEndPoint = "/json";

  // static String apiEndPointContactUs = "https://dev3.suvandnat.com/rest/V1/contactus";
  static String forgetPassword = '/V1/customers/password';
  static String forgetPasswordEndPoint = 'https://dev2.brands-labels.com';

  // static String bannerListEndPoint = "/bannerList";

  // static String apiEndPointNew = "https://www.sololuxury.com/rest/V1";

  // static String apiEndPoint = "https://api.suvandnat.com";

  // static String apiEndPoint = "https://dev3.suvandnat.com/rest/V1";

  //static String apiEndPoint = "https://api.suvandnat.com";

  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";

  static String apiCountryGet = "http://ip-api.com";
  static String apiEndPointNew2 = "https://dev3.sololuxury.com";
  static String apiEndPointDev = "https://www.suvandnat.com/rest";
  static String myTicketApi = '/rest/V1/mytickets/';

  static String stockNotifyMe = '/rest/V1/stocknotifyme';
  static String notifyMe = 'rest/V1/notifyMe';

  //static String apiEndPointMyAccount = "https://dev2.brands-labels.com/rest/V1/customers/me";

  // static String apiEndPoint = "https://api.suvandnat.com";
  //static String apiEndPoint = "https://www.sololuxury.com/rest/V1/";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";
  static String recommendedProductsEndPoint = "/V1/recommendedList?sku=";

  // static String orderConfirmationEndPoint =
  //     "http://dev3.sololuxury.com/rest/V1/orders/1";
  static String orderConfirmationEndPoint = "/V1/orders/";

  static String apiEndPoint = "https://www.sololuxury.com/rest/V1/";

  // static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  // static String apiEndPoint =
  //     "http://suvandnat-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up

  // static String signup = '/customers';
  //
  // static String login = "";
  static String signup = 'customers';

  // static String login = 'integration/customer/token';
  static String homepageManager = 'homepagemanagerList';
  static const String getSizeListApi = "/rest/V1/sizeList/";

  //static var defaultToken = "7e9pvvgo4u5kel2xlchlj4hmgjb0lu6s";
  static const String licenceId = '11434003';

  //static var defaultToken1 = "Bearer agbevtbb0s5oxg3iqvvgi72m133n8wqz";

  //static String signup = '/user';
  static String addAddress = '/rest/V1/customers/me';
  static String countryList = '/rest/V1/directory/countries';

  // static var defaultToken1 = "Bearer 7gefmzqycrj3f05sj150pp00bi5lx97f";

  static const String contactUs = "/rest/V1/contactus";
  static const String wishList = "/V1/wishlist";
  static const String brandList = "/rest/V1/brandList";
  static const String myOrders =
      "/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=";
  static const String deleteWishlist = "/rest/V1/wishlist/";
  static const String postWishlist = "/rest/V1/wishlist/";
  static String cancelReasonApi = '/rest/V1/order/cancellation/reasons';
  static String returnReasonStatusApi = '/rest/V1/returnStatus';
  static String returnOrderApi = '/rest/V1/order/return/';
  static String returnOrderItemApi = '/rest/V1/orderItem/return';

  static const String fontPoppins = 'Poppins';

/*  static const String fontOpenSans = 'OpenSans';*/

  static String brandListApi = 'brandList';
  static const String guestCreateCart = "/V1/guest-carts";
  static String privacyPolicyApi = '/rest/V1/cmspagemanagerList/18';
  static String temsConditionApi = '/rest/V1/cmspagemanagerList/19';
  static const String addressList = "/rest/V1/customers/me";
  static String addWishList = '/V1/wishlist/';
  static String returnReasonApi = '/rest/V1/orderReturnList/';
  static String postReturnReasonApi = '/V1/orderReturn';
  static String orderTrakingApi = '/rest/V1/orderTrackingList/';
  static String storeCreditApi = '/rest/V1/store/credits/balance/';
  static const String guestOrderApi = "/rest/V1/guest-carts/";
  static String createMyTicket = '/rest/V1/mytickets/create/';
  static const String couponsCode =
      "/rest/V1/coupons/search?searchCriteria[filter_groups][0][filters][0][field]=type&searchCriteria[filter_groups][0][filters][0][value]=0&searchCriteria[filter_groups][0][filters][0][condition_type]=equal";
  static const String addCouponsCodeToCart = "/V1/carts/mine/coupons/";
  static const String addGuestCouponsCodeToCart = "/V1/guest-carts/";
  static const String deleteGuestCoupons = "/V1/guest-carts/";
  static const String getTotals = "/V1/carts/mine/totals";
  static const String guestGetTotals = "/V1/guest-carts/";
  static const String deleteCoupons = "/V1/carts/mine/coupons";
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
