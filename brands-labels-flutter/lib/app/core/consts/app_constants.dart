import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../main/main.common.dart';

enum Environment { DEV, STAGING, PROD }

class AppConstants {
  static const String deeplinkBaseUrl = "https://brandslabels.page.link";
  // static String adminToken = EnvSecretConfigs.instance.adminToken;

  static const String baseUrlStaging = "https://www.brands-labels.com";
  static const String baseUrlProduction = "https://www.brands-labels.com";

  static const String fontOpenSans = 'OpenSans';

  static String apiEndPointLogin = "https://www.brands-labels.com";

  static String apiEstimatedTime =
      "https://www.brands-labels.com/rest/V1/estimate/date-api/";
  static const String shipping = "/rest/V1/cmspagemanagerList/20";

  static String login = '/rest/V1/integration/customer/token';
  static String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/V1/categories";
  static String menuEndPoint1 = "/rest/V1/categories";
  static String logoEndPoint = "/rest/V1/logoList";
  static String currencyEndPoint = "/rest/V1/directory/currency";
  static String homeEndPoint = "/V1/homepagemanagerList";
  static const String getTotals = "/V1/carts/mine/totals";
  static String stockNotifyMe = '/rest/V1/stocknotifyme';
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
  static String bannerListEndPoint = "/bannerList";
  static String filterlistEndPoint = "/rest/V1/layeredList/";
  static String orderConfirmationEndPoint = "/V1/orders/";
  static const String getProductDetailApi = "/V1/products/";
  static const String getChooseInOptionApi =
      "/rest/all/V1/products/attributes/size_v2/options/";
  static String optionsEndPoint = "/V1/products/attributes/brands/options";
  static String productListEndPoint =
      "/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=";
  static String sortedProductListEndPoint =
      "&searchCriteria[sortOrders][0][field]=price&searchCriteria[sortOrders][0][direction]=";

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

  static String filteredColorProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][2][filters][0][condition_type]=in";

  static String filteredBrandProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][1][filters][0][condition_type]=in";

  static String filteredSizeProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][3][filters][0][condition_type]=in";

  static String filteredCatProductListInConditionEndPoint =
      "&searchCriteria[filter_groups][0][filters][0][condition_type]=in";

  static String filteredPriceProductListEndPointForPriceRangeFrom =
      "&searchCriteria[filter_groups][4][filters][0][field]=price&searchCriteria[filter_groups][4][filters][0][value]=";

  static String filteredPriceProductListEndPointForPriceRangeTo =
      "&searchCriteria[filter_groups][5][filters][0][field]=price&searchCriteria[filter_groups][5][filters][0][value]=";

  static String filteredPriceFromProductListEndPoint =
      "&searchCriteria[filter_groups][4][filters][0][condition_type]=from";

  static String filteredPriceToProductListEndPoint =
      "&searchCriteria[filter_groups][5][filters][0][condition_type]=to";

  static String homeBrandProductListEndPoint =
      "/rest/all/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=brands&searchCriteria[filter_groups][0][filters][0][value]=";

  static const String couponsCode =
      "/rest/V1/coupons/search?searchCriteria[filter_groups][0][filters][0][field]=type&searchCriteria[filter_groups][0][filters][0][value]=0&searchCriteria[filter_groups][0][filters][0][condition_type]=equal";
  static const String returnsAndRefund = "/rest/V1/cmspagemanagerList/15";
  static const String faq = "/rest/default/V1/snowdog/cmsPage/16";

  static String getUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/rest/${localStore.currentCode}";
  }

  static String getDeleteUrlWithCode() {
    return localStore.currentCode.isEmpty
        ? "/rest"
        : "/${localStore.currentCode}/rest/${localStore.currentCode}";
  }

  static String getGuestUrlWithCode(url) {
    return "/rest/V1/guest-carts/${localStore.guestToken}$url";
  }

  static dismissKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static const String shippingInformation = "/shipping-information";
  static const String estimateMethods = "/estimate-shipping-methods";

  static String productImageUrl = "$apiEndPointLogin/media/catalog/product/";

  // static String menuEndPoint = "/categories";
  // static String logoEndPoint = "/logoList";
  // static String currencyEndPoint = "/directory/currency";
  // static String homeEndPoint = "/homepagemanagerList";
  // static String estimatesShippingMethodEndPoint = "/in-en/V1/carts/mine/estimate-shipping-methods";
  // static String shippingInformationEndPoint = "/in-en/V1/carts/mine/shipping-information";
  // static String multiAddressEndPoint = "/V1/customers/me";
  // static String storeWebsitesEndPoint = "/V1/store/websites";
  // static String storeViewsEndPoint = "/V1/store/storeViews";
  // static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  // static String referFriendEndPoint = "/V1/referFriend";
  static String myTicketAPI = "/rest/V1/mytickets/";
  // static String tokenFaq = "Bearer yn6yadqv0l8uem5rvo4pt6invys7gpo8";

  static String apiEndPointNew2 = "https://dev3.sololuxury.com";
  static String jsonEndPoint = "/json";

  static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  static String apiEndPointDev = "https://www.sololuxury.com/rest";

  static String notifyMe = '/V1/stocknotifyme';

  //static String apiEndPoint = "https://dev3.brands-labels.com/rest/V1";
  static String apiCountryGet = "http://ip-api.com";

  // static String apiEndPointContactUs = "https://dev3.brands-labels.com/rest/V1/contactus";

  //static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  // static const String defaultToken1 = "Bearer 7gefmzqycrj3f05sj150pp00bi5lx97f";

  //Sign Up
  // static String signup = '/user';
  //static String defaultToken = 'f8u85tezcfknwg5icqx86fi9zqs7axbi';

  // static String login = "";
  static String forgetPassword = '/V1/customers/password';
  static String forgetPasswordEndPoint = 'https://dev2.brands-labels.com';

  //static String apiEndPoint = "https://dev3.brands-labels.com/rest/V1/";

  //static String apiEndPoint = "https://api.brandslabels.com";

  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";

  //static String apiEndPoint = "https://dev3.brands-labels.com/rest/V1";

  static String recommendedProductsEndPoint = "/V1/recommendedList?sku=";

  static String apiEndPointMyAccount = "/rest/V1/customers/me";

  // static String apiEndPoint = "https://api.brandslabels.com";
  // static String apiEndPoint = "https://dev2.brands-labels.com/rest/V1/";

  // static String apiEndPoint = "https://dev3.brands-labels.com/rest/V1";

  static String apiEndPoint = "https://www.sololuxury.com/rest/V1/";
  static const String getSizeListApi = "/rest/V1/sizeList/";

  // static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";

  // static String apiEndPoint =
  //     "http://brandslabels-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up

  static String signup = 'customers';

  // static String login = 'integration/customer/token';

  static const String licenceId = '11434003';
  // static var defaultToken = EnvSecretConfigs.instance.defaultToken;

  //static String signup = '/user';
  static String addAddress = '/rest/V1/customers/me';
  static String countryList = '/rest/V1/directory/countries';

  static const String contactUs = "/rest/V1/contactus";
  static const String fullContactUs =
      "https://www.brands-labels.com/rest/V1/contactus";
  static const String specialRequest = "/rest/V1/mytickets/create/";

  static const String wishList = "/V1/wishlist";
  static const String brandList = "/rest/V1/brandList";
  static const String myOrders =
      "/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=";
  static const String deleteWishlist = "/V1/wishlist/";
  static const String postWishlist = "/V1/wishlist/";

  static const String fontPoppins = 'Poppins';
/*  static const String fontMontserrat = 'Montserrat';*/

  static String myTicketApi = '/rest/V1/mytickets/';
  static String ticketApi =
      'https://erp.theluxuryunlimited.com/api/ticket/send';
  static String speiclaSizeApi = '/V1/notifyMe';

  static String brandListApi = 'brandList';
  static String createOrderEndPoint = "/rest/V1/orders/create";

  // static const String cartToken = "Bearer ifzsdwv4mlnpfbwnz38q204d3zlb3lju";
  static const String cartGetData = "/V1/carts/mine";
  static const String deleteCartProdyctData = "/V1/carts/mine/items/";
  static const String addTocartData = "/V1/carts/mine/items";
  static const String addTocartData2 = "/rest/in-en/V1/carts/mine/items";
  static const String createCart = "/V1/carts/mine/";
  static const String guestCreateCart = "/V1/guest-carts";
  static String privacyPolicyApi = '/rest/V1/cmspagemanagerList/18';
  static String temsConditionApi = '/rest/V1/cmspagemanagerList/19';
  static const String addressList = "/rest/V1/customers/me";
  static String addWishList = '/V1/wishlist/';
  static String returnReasonApi = '/rest/V1/orderReturnList/';
  static String postReturnReasonApi = '/rest/in-en/V1/orderReturn';
  static String orderTrakingApi = '/rest/V1/orderTrackingList/';
  static String storeCreditApi = '/rest/V1/store/credits/balance/';
  static String createMyTicket = '/rest/V1/mytickets/create/';
  static const String guestOrderApi = "/rest/V1/guest-carts/";
  static const String donationGetData = "/rest/V1/donation/list";
  static String myTrackTicket = '/rest/V1/mytickets/byEmail/';
  static const String addCouponsCodeToCart = "/V1/carts/mine/coupons/";
  static const String addGuestCouponsCodeToCart = "/V1/guest-carts/";
  static const String deleteGuestCoupons = "/V1/guest-carts/";
  static const String guestGetTotals = "/V1/guest-carts/";
  static const String deleteCoupons = "/V1/carts/mine/coupons";
}

AndroidDeviceInfo? deviceInfo;
PackageInfo packageInfo = PackageInfo(
  appName: 'Unknown',
  packageName: 'Unknown',
  version: 'Unknown',
  buildNumber: 'Unknown',
  buildSignature: 'Unknown',
);
