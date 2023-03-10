import 'package:meta_package/api/models/home/menu_model.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import 'package:meta_package/api/models/recommended_products/recommended_products_model.dart';
import 'package:meta_package/api/models/search/search_model.dart';

abstract class ISplashRepository {
  Future<String> getSplashAPIResponse();
}

abstract class IReferFriendRepository {
  Future<dynamic> getReferFriendAPIResponse();
}

abstract class ILoginRepository {
  Future<dynamic> getLoginAPIResponse(
      String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<dynamic> getSignupAPIResponse(String signupRequestJson);
}

abstract class IInfluencerRepository {
  Future<dynamic> getInfluencerAPIResponse(String influencerRequestJson);
}

abstract class IDashboardRepository {
  Future<dynamic> getMenuAPIResponse();
}

abstract class ISearchRepository {
  Future<MenuModel> getMenuAPIResponse();

  Future<SearchModel> getSearchAPIResponse();

  Future<ProductModel> getSearchProductAPIResponse();
}

abstract class IHomeRepository {}

abstract class ICountryRepository {
  Future<dynamic> getStoreWebsitesAPIResponse();

  Future<dynamic> getStoreViewsAPIResponse();

  Future<dynamic> getStoreConfigsAPIResponse();
}

abstract class IAffiliateRepository {
  Future<dynamic> getAffiliateAPIResponse();
}

abstract class ICheckoutOrderRepository {
  Future<dynamic> postShippingInformationAPIResponse(String requestJson);

  Future<dynamic> postGuestShippingInformationResponse(String requestJson);

  Future<dynamic> getMultiAddressAPIResponse();

  Future<dynamic> postEstimateAPIResponse(String loginRequestJson);

  Future<dynamic> postGuestEstimateAPIResponse(String loginRequestJson);

  Future<dynamic> postCreateOrderAPIResponse(String loginRequestJson);

  Future<dynamic> getCountryListResponse();

  Future<dynamic> postaddAddressApiResponse(String loginRequestJson);

  Future<dynamic> getAddressListResponse();

  Future<dynamic> postGuestCreateOrderAPIResponse(
      String loginRequestJson, String cartid);
}

///myAccount Class
abstract class IMyAccountRepository {
  Future<MyAccountDetails> getMyAccountApiResponse();
}

///cart Class
abstract class ICartRepository {
  Future<dynamic> getCartGetDataApiResponse(
    String apiEndPoint,
  );

  Future<dynamic> deleteCartCartQTYDataApiResponse(
      String itemId, String apiEndPOint);

  Future<dynamic> getDonationListData(String apiEndPOint);
}

abstract class IContactUsRepository {
  Future<dynamic> getContactUsApiResponse(
      String contactusRequestJson,
      String orderNo,
      String country,
      String subject,
      String message,
      String sourceOfTicket,
      String phoneNumber,
      String typeOfEnquiry,
      String email,
      String name,
      String lastName);
}

///RecommendedProduct Class
abstract class IRecommendedProductsRepository {
  Future<RecommendedProductModel> getMyAccountApiResponse();
}

///forget password Class
abstract class IForgetPasswordRepository {
  Future<String> putForgetPasswordApiResponse();
}

abstract class ICountryListRepository {
  Future<dynamic> getCountryListResponse();

  Future<dynamic> postaddAddressApiResponse(String response);
}

///orderConfirmation Class
abstract class IOrderConfirmationRepository {
  Future<dynamic> getOrderConfirmationApiResponse();
}

abstract class IMyTicketRepository {
  Future<dynamic> getmyTicketApiResponse(String response);
}

abstract class IProductListRepository {
  Future<ProductModel> getProductListApiResponse(
      String categoryId, bool isBrand);

  Future<List<dynamic>> getOptionsListApiResponse();

  Future<List<dynamic>> getFilterListApiResponse(String id);
}

abstract class IWishListRepository {
  Future<WishListProductModel> getWishListApiResponse();
}

abstract class IDeleteWishListRepository {
  Future<dynamic> deleteWishListApiResponse(String id);
}

abstract class IFaqRepository {
  Future getFaqApiResponse();
}

abstract class IShippingRepository {
  Future getShippingApiResponse();
}

abstract class IReturnsAndRefundsRepository {
  Future getReturnsRefundsApiResponse();
}

abstract class IMyOrdersRepository {
  Future<MyOrdersData> getMyOrdersApiResponse();
}

abstract class IPostWishListRepository {
  Future<dynamic> postWishListApiResponse(String sku);
}

abstract class IBrandListRepository {
  Future<dynamic> getBrandListResponse();
}

abstract class IPrivacyPolicyRepository {
  Future<dynamic> getPrivacyPolicyResponse();
}

abstract class ITermAndConditionRepository {
  Future<dynamic> getTermAndConditionResponse();
}

abstract class IAddressListRepository {
  Future<dynamic> getAddressListResponse();
}

abstract class IReturnReasonRepository {
  Future<dynamic> getReturnReasonResponse();

  Future<dynamic> postReturnItemAPIResponse(String orderId, String productsku,
      String email, String reason, String langCode);

  Future<dynamic> getOrderTeakingResponse(String id);
}

abstract class IStoreCreditRepository {
  Future<String> getStoreCreditResponse(String id);
}

abstract class ISelectCountryRepository {
  Future<String> getSelectCountryResponse();
}
