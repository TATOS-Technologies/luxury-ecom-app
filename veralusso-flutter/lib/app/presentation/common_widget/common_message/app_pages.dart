import 'package:get/get.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/screens/add_address/add_address.dart';
import 'package:veralusso/app/presentation/screens/add_address/add_address_binding.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/affiliate_program_bindings.dart';
import 'package:veralusso/app/presentation/screens/affiliate_program/affiliate_program_screen.dart';
import 'package:veralusso/app/presentation/screens/app_secure_shopping/app_secure_shopping.dart';
import 'package:veralusso/app/presentation/screens/app_secure_shopping/app_secure_shopping_binding.dart';
import 'package:veralusso/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:veralusso/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:veralusso/app/presentation/screens/cart/cart_binding.dart';
import 'package:veralusso/app/presentation/screens/cart/cart_screen.dart';
import 'package:veralusso/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:veralusso/app/presentation/screens/checkout_order/checkout_order_screen.dart';
import 'package:veralusso/app/presentation/screens/contact_us/contact_us_binding.dart';
import 'package:veralusso/app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:veralusso/app/presentation/screens/country/country_binding.dart';
import 'package:veralusso/app/presentation/screens/country_screen/country_screen.dart';
import 'package:veralusso/app/presentation/screens/country/country_screen.dart'
    as c;
import 'package:veralusso/app/presentation/screens/country_screen/country_screen_binding.dart';
import 'package:veralusso/app/presentation/screens/dashboard/dashboard_binding.dart';
import 'package:veralusso/app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:veralusso/app/presentation/screens/donation/charity_binding.dart';
import 'package:veralusso/app/presentation/screens/donation/donation_screen.dart';
import 'package:veralusso/app/presentation/screens/faq/faq_binding.dart';
import 'package:veralusso/app/presentation/screens/faq/faq_screen.dart';
import 'package:veralusso/app/presentation/screens/filter/filter_binding.dart';
import 'package:veralusso/app/presentation/screens/filter/list_filter.dart';
import 'package:veralusso/app/presentation/screens/guest_returns/guest_returns_binding.dart';
import 'package:veralusso/app/presentation/screens/guest_returns/guest_returns_screen.dart';
import 'package:veralusso/app/presentation/screens/home/home_binding.dart';
import 'package:veralusso/app/presentation/screens/home/home_screen.dart';
import 'package:veralusso/app/presentation/screens/influencer_registraction/influencer_binding.dart';
import 'package:veralusso/app/presentation/screens/influencer_registraction/influencer_registration_screen.dart';
import 'package:veralusso/app/presentation/screens/influencer_registraction_thankyou/influencer_registration_thankyou_screen.dart';
import 'package:veralusso/app/presentation/screens/login/email_password_invalid_screen.dart';
import 'package:veralusso/app/presentation/screens/login/forget_password_binding.dart';
import 'package:veralusso/app/presentation/screens/login/forgot_password.dart';
import 'package:veralusso/app/presentation/screens/login/login_binding.dart';
import 'package:veralusso/app/presentation/screens/login/login_screen.dart';
import 'package:veralusso/app/presentation/screens/login/logout_success_screen.dart';
import 'package:veralusso/app/presentation/screens/my_account/my_account_binding.dart';
import 'package:veralusso/app/presentation/screens/my_account/my_account_information_binding.dart';
import 'package:veralusso/app/presentation/screens/my_account/my_account_menu_screen.dart';
import 'package:veralusso/app/presentation/screens/my_account/my_account_information_screen.dart';
import 'package:veralusso/app/presentation/screens/my_address/my_address.dart';
import 'package:veralusso/app/presentation/screens/my_address/my_address_binding.dart';
import 'package:veralusso/app/presentation/screens/my_orders/my_orders_binding.dart';
import 'package:veralusso/app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:veralusso/app/presentation/screens/my_orders/order_details/order_details_binding.dart';
import 'package:veralusso/app/presentation/screens/my_orders/order_details/order_details_screen.dart';
import 'package:veralusso/app/presentation/screens/my_tickets/my_tickets_binding.dart';
import 'package:veralusso/app/presentation/screens/my_tickets/my_tickets_screen.dart';
import 'package:veralusso/app/presentation/screens/news_letter/news_letter_binding.dart';
import 'package:veralusso/app/presentation/screens/news_letter/news_letter_screen.dart';
import 'package:veralusso/app/presentation/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:veralusso/app/presentation/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:veralusso/app/presentation/screens/privacy_policy/privacy_policy_binding.dart';
import 'package:veralusso/app/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_binding.dart';
import 'package:veralusso/app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:veralusso/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:veralusso/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:veralusso/app/presentation/screens/refer_friend/refer_friend_binding.dart';
import 'package:veralusso/app/presentation/screens/refer_friend/refer_friend_screen.dart';
import 'package:veralusso/app/presentation/screens/returns_and_refunds/returns_and_refunds_binding.dart';
import 'package:veralusso/app/presentation/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:veralusso/app/presentation/screens/search/search_binding.dart';
import 'package:veralusso/app/presentation/screens/search/search_screen.dart';
import 'package:veralusso/app/presentation/screens/select_country/select_country_binding.dart';
import 'package:veralusso/app/presentation/screens/select_country/select_country_screen.dart';
import 'package:veralusso/app/presentation/screens/shipping/shipping_binding.dart';
import 'package:veralusso/app/presentation/screens/shipping/shipping_screen.dart';
import 'package:veralusso/app/presentation/screens/signup/signup_binding.dart';
import 'package:veralusso/app/presentation/screens/signup/signup_screen.dart';
import 'package:veralusso/app/presentation/screens/special_request/request_received_screen.dart';
import 'package:veralusso/app/presentation/screens/special_size_request/special_size_request_binding.dart';
import 'package:veralusso/app/presentation/screens/special_size_request/special_size_request_screen.dart';
import 'package:veralusso/app/presentation/screens/splash/splash_binding.dart';
import 'package:veralusso/app/presentation/screens/splash/splash_screen.dart';
import 'package:veralusso/app/presentation/screens/store_credit/store_credit.dart';
import 'package:veralusso/app/presentation/screens/store_credit/store_credit_binding.dart';
import 'package:veralusso/app/presentation/screens/teams_condition/terms_condition.dart';
import 'package:veralusso/app/presentation/screens/teams_condition/terms_condition_binding.dart';
import 'package:veralusso/app/presentation/screens/track_ticket_list/trace_my_ticket_screen.dart';
import 'package:veralusso/app/presentation/screens/track_ticket_list/track_ticket_binding.dart';
import 'package:veralusso/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_binding.dart';
import 'package:veralusso/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_screen.dart';
import 'package:veralusso/app/presentation/screens/wishlist/wishlist_binding.dart';
import 'package:veralusso/app/presentation/screens/wishlist/wishlist_screen.dart';

import '../../screens/special_request/special_request_binding.dart';
import '../../screens/special_request/special_request_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.logoutSuccess,
      page: () => const LogOutSuccess(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesConstants.newsLetterScreen,
      page: () => const NewsLetterScreen(),
      binding: NewsLetterBindings(),
    ),
    GetPage(
      name: RoutesConstants.shippingScreen,
      page: () => ShippingScreen(),
      binding: ShippingBinding(),
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
      name: RoutesConstants.checkoutOrderScreen,
      page: () => CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
    GetPage(
      name: RoutesConstants.addAddress,
      page: () => AddAddressScreen(),
      binding: AddAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.dashboardScreen,
      page: () => DashboardScreen(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: RoutesConstants.brandScreen,
      page: () => BrandListPage(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => SearchScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.appSecureShoppingScreen,
      page: () => AppSecureShoppingScreen(),
      binding: AppSecureShoppingBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreen,
      page: () => MyAccountMenuPage(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.searchScreen,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RoutesConstants.wishlistScreen,
      page: () => MyWishListPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesConstants.charityScreen,
      page: () => const CharityScreen(),
      binding: CharityBinding(),
    ),
    GetPage(
      name: RoutesConstants.signupScreen,
      page: () => SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: RoutesConstants.faqScreen,
      page: () => FaqScreen(),
      binding: FaqBindings(),
    ),
    GetPage(
      name: RoutesConstants.affiliateProgramScreen,
      page: () =>  AffiliateProgramScreen(),
      binding: AffiliateProgramBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationThankyouScreen,
      page: () => const InfluencerRegistrationThankYouScreen(),
      //binding: InfluencerRegistrationThankyouBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreenScreen,
      page: () => MyAccountInformationScreen(),
      binding: MyAccountInformationBinding(),
    ),
    GetPage(
      name: RoutesConstants.myAddress,
      page: () => const MyAddressScreen(),
      binding: MyAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.storeCreditScreen,
      page: () => const StoreCreditScreen(),
      binding: StoreCreditBindings(),
    ),
    GetPage(
      name: RoutesConstants.selectCountryScreen,
      page: () => const SelectCountryScreen(),
      binding: SelectCountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryPopUpScreen,
      page: () => const CountryPopUpScreen(),
      binding: CountryPopUpScreenBindings(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnScreen,
      page: () => const GuestReturnsScreen(),
      binding: GuestReturnsBinding(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => const InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => c.CountryScreen(),
      binding: CountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.orderConfirmationScreen,
      page: () => OrderConfirmationPage(),
      binding: OrderConfirmationBinding(),
    ),
    GetPage(
      name: RoutesConstants.returnsAndRefundsScreen,
      page: () => const ReturnsAndRefundsScreen(),
      binding: ReturnsAndRefundsBinding(),
    ),
    GetPage(
      name: RoutesConstants.contactUsScreen,
      page: () => const ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.myTickets,
      page: () => MyTicketScreen(),
      binding: MyTicketsBindings(),
    ),
    GetPage(
      name: RoutesConstants.myOrderScreen,
      page: () => MyOrdersScreen(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: RoutesConstants.productDetailsScreen,
      page: () => ProductDetailScreen(),
      binding: ProductDetailsBindings(),
    ),
    GetPage(
      name: RoutesConstants.referFriendScreen,
      page: () =>  ReferFriendScreen(),
      binding: ReferFriendBindings(),
    ),
    GetPage(
      name: RoutesConstants.specialSizeRequestScreen,
      page: () => SpecialSizeRequestScreen(),
      binding: SpecialSizeRequestBinding(),
    ),
    GetPage(
      name: RoutesConstants.filterScreen,
      page: () => ListFilterPage(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.termsConditionScreen,
      page: () => const TeamsConditionScreen(),
      binding: TeamsConditionBindings(),
    ),
    GetPage(
      name: RoutesConstants.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: RoutesConstants.orderDetailsScreen,
      page: () => OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.specialRequestScreen,
      page: () => SpecialRequestScreen(),
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
    GetPage(
      name: RoutesConstants.traceYourTicketMail,
      page: () => const TraceYourTicketMail(),
      binding: TrackYourTicketEmailBinding(),
    ),
    GetPage(
      name: RoutesConstants.trackTicketScreen,
      page: () => TrackTicketScreen(),
      binding: TrackTicketListBinding(),
    ),
  ];
}
