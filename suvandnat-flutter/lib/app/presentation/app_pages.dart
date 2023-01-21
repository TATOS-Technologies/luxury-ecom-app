import 'package:suvandnat/app/presentation/screens/affiliate_program/affiliate_program_bindings.dart';
import 'package:suvandnat/app/presentation/screens/affiliate_program/affiliate_program_screen.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:suvandnat/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:suvandnat/app/presentation/screens/cart/cart_binding.dart';
import 'package:suvandnat/app/presentation/screens/cart/cart_screen.dart';
import 'package:suvandnat/app/presentation/screens/charity/charity_binding.dart';
import 'package:suvandnat/app/presentation/screens/charity/charity_screen.dart';
import 'package:suvandnat/app/presentation/screens/country/country_screen.dart';
import 'package:suvandnat/app/presentation/screens/faq/faq_binding.dart';
import 'package:suvandnat/app/presentation/screens/faq/faq_screen.dart';
import 'package:suvandnat/app/presentation/screens/home/bindings/home_binding.dart';
import 'package:suvandnat/app/presentation/screens/home/home_screen.dart';
import 'package:suvandnat/app/presentation/screens/influencer_registraction_thankyou/influencer_registration_thankyou_screen.dart';
import 'package:suvandnat/app/presentation/screens/login/bindings/forget_password_binding.dart';
import 'package:suvandnat/app/presentation/screens/login/bindings/login_binding.dart';
import 'package:suvandnat/app/presentation/screens/login/views/email_password_invalid_screen.dart';
import 'package:suvandnat/app/presentation/screens/login/views/forgot_password.dart';
import 'package:suvandnat/app/presentation/screens/login/views/login_screen.dart';
import 'package:suvandnat/app/presentation/screens/influencer_registraction/influencer_registration_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_account/my_account_information_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_account/my_account_information_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_orders/my_orders_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_orders/order_details/order_details_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_orders/order_details/order_details_screen.dart';
import 'package:suvandnat/app/presentation/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:suvandnat/app/presentation/screens/privacy_policy/privacy_policy_binding.dart';
import 'package:suvandnat/app/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:suvandnat/app/presentation/screens/returns_and_refunds/returns_and_refunds_binding.dart';
import 'package:suvandnat/app/presentation/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_tickets/my_tickets_binding.dart';
import 'package:suvandnat/app/presentation/screens/my_tickets/my_tickets_screen.dart';
import 'package:suvandnat/app/presentation/screens/add_address/add_address.dart';
import 'package:suvandnat/app/presentation/screens/add_address/add_address_binding.dart';
import 'package:suvandnat/app/presentation/screens/country_screen/country_screen.dart';
import 'package:suvandnat/app/presentation/screens/country_screen/country_screen_binding.dart';
import 'package:suvandnat/app/presentation/screens/guest_returns/guest_returns_binding.dart';
import 'package:suvandnat/app/presentation/screens/guest_returns/guest_returns_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_address/my_address.dart';
import 'package:suvandnat/app/presentation/screens/my_address/my_address_binding.dart';
import 'package:suvandnat/app/presentation/screens/search/search_binding.dart';
import 'package:suvandnat/app/presentation/screens/select_country/select_country.dart';
import 'package:suvandnat/app/presentation/screens/select_country/select_country_binding.dart';
import 'package:suvandnat/app/presentation/screens/special_request/request_received_screen.dart';
import 'package:suvandnat/app/presentation/screens/special_request/special_request_binding.dart';
import 'package:suvandnat/app/presentation/screens/special_request/special_request_screen.dart';
import 'package:suvandnat/app/presentation/screens/splash/splash_binding.dart';
import 'package:suvandnat/app/presentation/screens/splash/splash_screen.dart';
import 'package:suvandnat/app/presentation/screens/store_credit/store_credit.dart';
import 'package:suvandnat/app/presentation/screens/store_credit/store_credit_binding.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/terms_condition/terms_condition.dart';
import 'package:suvandnat/app/presentation/screens/terms_condition/terms_condition_binding.dart';
import 'package:suvandnat/app/presentation/screens/contact_us/contact_us_binding.dart';
import 'package:suvandnat/app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:suvandnat/app/presentation/screens/country/country_binding.dart';
import 'package:suvandnat/app/presentation/screens/filter/filter_binding.dart';
import 'package:suvandnat/app/presentation/screens/filter/list_filter.dart';
import 'package:suvandnat/app/presentation/screens/influencer_registraction/influencer_binding.dart';
import 'package:suvandnat/app/presentation/screens/login/views/logout_success_screen.dart';
import 'package:suvandnat/app/presentation/screens/my_account/my_account_menu_screen.dart';
import 'package:suvandnat/app/presentation/screens/news_letter/news_letter_binding.dart';
import 'package:suvandnat/app/presentation/screens/news_letter/news_letter_screen.dart';
import 'package:suvandnat/app/presentation/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/product_detail_binding.dart';
import 'package:suvandnat/app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:suvandnat/app/presentation/screens/refer_friend/refer_friend_binding.dart';
import 'package:suvandnat/app/presentation/screens/refer_friend/refer_friend_screen.dart';
import 'package:suvandnat/app/presentation/screens/shipping/shipping_binding.dart';
import 'package:suvandnat/app/presentation/screens/shipping/shipping_screen.dart';
import 'package:suvandnat/app/presentation/screens/wishlist/wishlist_binding.dart';
import 'package:suvandnat/app/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:suvandnat/app/presentation/screens/checkout_order/checkout_order_screen.dart';
import 'package:suvandnat/app/presentation/screens/dashboard/dashboard_binding.dart';
import 'package:suvandnat/app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:suvandnat/app/presentation/screens/signup/signup_binding.dart';
import 'package:suvandnat/app/presentation/screens/signup/signup_screen.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:suvandnat/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:suvandnat/app/presentation/screens/search/search_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.newsLetterScreen,
      page: () => NewsLetterScreen(),
      binding: NewsLetterBindings(),
    ),
    GetPage(
      name: RoutesConstants.logoutSuccess,
      page: () => const LogOutSuccess(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesConstants.shippingScreen,
      page: () => ShippingScreen(),
      binding: ShippingBinding(),
    ),
    GetPage(
      name: RoutesConstants.orderConfirmationScreen,
      page: () => OrderConfirmationPage(),
      binding: OrderConfirmationBinding(),
    ),
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.forgotPasswordPage,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordMenuBinding(),
    ),
    GetPage(
      name: RoutesConstants.filterScreen,
      page: () => ListFilterPage(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreen,
      page: () => MyAccountMenuPage(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.wishlistScreen,
      page: () => MyWishListPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesConstants.searchScreen,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RoutesConstants.brandScreen,
      page: () => BrandListPage(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: RoutesConstants.checkoutOrderScreen,
      page: () => CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
    GetPage(
      name: RoutesConstants.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: RoutesConstants.faqScreen,
      page: () => FaqScreen(),
      binding: FaqBindings(),
    ),
    GetPage(
      name: RoutesConstants.signUpScreen,
      page: () => SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreenScreen,
      page: () => const MyAccountInformationScreen(),
      binding: MyAccountInformationBinding(),
    ),
    GetPage(
      name: RoutesConstants.returnsAndRefundsScreen,
      page: () => const ReturnsAndRefundsScreen(),
      binding: ReturnsAndRefundsBinding(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationThankyouScreen,
      page: () => const InfluencerRegistrationThankYouScreen(),
      //binding: InfluencerRegistrationThankyouBindings(),
    ),
    GetPage(
      name: RoutesConstants.myTickets,
      page: () => const MyTicketsScreen(),
      binding: MyTicketsBindings(),
    ),
    GetPage(
      name: RoutesConstants.addAddressScreen,
      page: () => AddAddressScreen(),
      binding: AddAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAddressScreen,
      page: () => const MyAddressScreen(),
      binding: MyAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.selectCountryScreen,
      page: () => SelectCountryScreen(),
      binding: SelectCountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.storeCreditScreen,
      page: () => const StoreCreditScreen(),
      binding: StoreCreditBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => CountryScreen(),
      binding: CountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnsScreen,
      page: () => const GuestReturnsScreen(),
      binding: GuestReturnsBindings(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.affiliateProgramScreen,
      page: () => AffiliateProgramScreen(),
      binding: AffiliateProgramBindings(),
    ),
    GetPage(
      name: RoutesConstants.charityScreen,
      page: () => const CharityScreen(),
      binding: CharityBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => SearchScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.myOrderScreen,
      page: () => MyOrdersScreen(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: RoutesConstants.contactUsScreen,
      page: () => ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.referFriendsScreen,
      page: () => const ReferFriendScreen(),
      binding: ReferFriendBindings(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.productDetailsScreen,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailsBindings(),
    ),
    GetPage(
      name: RoutesConstants.productDetailsScreenFromDeepLink,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailsBindings(),
    ),
    GetPage(
      name: RoutesConstants.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: RoutesConstants.termsConditionScreen,
      page: () => const TeamsConditionScreen(),
      binding: TeamsConditionBindings(),
    ),
    GetPage(
      name: RoutesConstants.orderDetailsScreen,
      page: () => OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.countryPopUPScreen,
      page: () => const CountryPopUpScreen(),
      binding: CountryPopUpScreenBindings(),
    ),
    GetPage(
      name: RoutesConstants.specialRequestScreen,
      page: () => const SpecialRequestScreen(),
      binding: SpecialRequestBinding(),
    ),
    GetPage(
      name: RoutesConstants.emailPasswordInvalidScreen,
      page: () => const EmailPasswordInvalidScreen(),
    ),
    GetPage(
      name: RoutesConstants.requestReceivedScreen,
      page: () => const RequestReceivedScreen(),
    ),
  ];
}
