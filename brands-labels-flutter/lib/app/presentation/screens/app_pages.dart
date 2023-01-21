import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/presentation/screens/add_address/add_address.dart';
import 'package:brandslabels/app/presentation/screens/add_address/add_address_binding.dart';
import 'package:brandslabels/app/presentation/screens/affiliate_program/affiliate_program_bindings.dart';
import 'package:brandslabels/app/presentation/screens/affiliate_program/affiliate_program_screen.dart';
import 'package:brandslabels/app/presentation/screens/brand_list/brand_binding.dart';
import 'package:brandslabels/app/presentation/screens/brand_list/brand_list_page.dart';
import 'package:brandslabels/app/presentation/screens/cart/cart_binding.dart';
import 'package:brandslabels/app/presentation/screens/cart/cart_screen.dart';
import 'package:brandslabels/app/presentation/screens/charity/charity_binding.dart';
import 'package:brandslabels/app/presentation/screens/charity/charity_screen.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/checkout_binding.dart';
import 'package:brandslabels/app/presentation/screens/checkout_order/checkout_order_screen.dart';
import 'package:brandslabels/app/presentation/screens/contact_us/contact_us_binding.dart';
import 'package:brandslabels/app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:brandslabels/app/presentation/screens/country/country_binding.dart';
import 'package:brandslabels/app/presentation/screens/country/country_screen.dart';
import 'package:brandslabels/app/presentation/screens/dashboard/dashboard_binding.dart';
import 'package:brandslabels/app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:brandslabels/app/presentation/screens/faq/faq_binding.dart';
import 'package:brandslabels/app/presentation/screens/faq/faq_screen.dart';
import 'package:brandslabels/app/presentation/screens/filter/filter_binding.dart';
import 'package:brandslabels/app/presentation/screens/filter/list_filter.dart';
import 'package:brandslabels/app/presentation/screens/guest_returns/guest_returns_binding.dart';
import 'package:brandslabels/app/presentation/screens/guest_returns/guest_returns_screen.dart';
import 'package:brandslabels/app/presentation/screens/home/home_binding.dart';
import 'package:brandslabels/app/presentation/screens/home/home_screen.dart';
import 'package:brandslabels/app/presentation/screens/influencer_registraction/influencer_binding.dart';
import 'package:brandslabels/app/presentation/screens/influencer_registraction/influencer_registration_screen.dart';
import 'package:brandslabels/app/presentation/screens/influencer_registraction_thankyou/influencer_registration_thankyou_screen.dart';
import 'package:brandslabels/app/presentation/screens/login/bindings/forget_password_binding.dart';
import 'package:brandslabels/app/presentation/screens/login/bindings/login_bindings.dart';
import 'package:brandslabels/app/presentation/screens/login/views/email_password_invalid_screen.dart';
import 'package:brandslabels/app/presentation/screens/login/views/forgot_password.dart';
import 'package:brandslabels/app/presentation/screens/login/views/login_screen.dart';
import 'package:brandslabels/app/presentation/screens/login/views/logout_success_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_account/change_password_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_account/change_password_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_account/my_account_information_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_account/my_account_information_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_address/my_address.dart';
import 'package:brandslabels/app/presentation/screens/my_address/my_address_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_coupons/my_coupons_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_coupons/my_coupons_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/my_orders_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/order_details/order_details_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_orders/order_details/order_details_screen.dart';
import 'package:brandslabels/app/presentation/screens/my_tickets/my_ticket_binding.dart';
import 'package:brandslabels/app/presentation/screens/my_tickets/my_ticket_screen.dart';
import 'package:brandslabels/app/presentation/screens/news_letter/news_letter_binding.dart';
import 'package:brandslabels/app/presentation/screens/news_letter/news_letter_screen.dart';
import 'package:brandslabels/app/presentation/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:brandslabels/app/presentation/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:brandslabels/app/presentation/screens/privacy_policy_brand_lable/privacy_policy_binding.dart';
import 'package:brandslabels/app/presentation/screens/privacy_policy_brand_lable/privacy_policy_screen.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:brandslabels/app/presentation/screens/product_detail/widgets/product_detail_binding.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/product_list_binding.dart';
import 'package:brandslabels/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:brandslabels/app/presentation/screens/refer_friend/refer_friend_binding.dart';
import 'package:brandslabels/app/presentation/screens/refer_friend/refer_friend_screen.dart';
import 'package:brandslabels/app/presentation/screens/returns_and_refunds/returns_and_refunds_binding.dart';
import 'package:brandslabels/app/presentation/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:brandslabels/app/presentation/screens/search/search_binding.dart';
import 'package:brandslabels/app/presentation/screens/search/search_screen.dart';
import 'package:brandslabels/app/presentation/screens/select_country/select_country.dart';
import 'package:brandslabels/app/presentation/screens/select_country/select_country_binding.dart';
import 'package:brandslabels/app/presentation/screens/shipping/shipping_binding.dart';
import 'package:brandslabels/app/presentation/screens/shipping/shipping_screen.dart';
import 'package:brandslabels/app/presentation/screens/signup/signup_screen.dart';
import 'package:brandslabels/app/presentation/screens/signup/sigup_binding.dart';
import 'package:brandslabels/app/presentation/screens/special_request/request_received_screen.dart';
import 'package:brandslabels/app/presentation/screens/special_request/special_reques_binding.dart';
import 'package:brandslabels/app/presentation/screens/special_request/special_request_screen.dart';
import 'package:brandslabels/app/presentation/screens/special_size_request/special_size_request.dart';
import 'package:brandslabels/app/presentation/screens/special_size_request/special_size_request_binding.dart';
import 'package:brandslabels/app/presentation/screens/splash/splash_binding.dart';
import 'package:brandslabels/app/presentation/screens/splash/splash_screen.dart';
import 'package:brandslabels/app/presentation/screens/store_credit/store_credit.dart';
import 'package:brandslabels/app/presentation/screens/store_credit/store_credit_binding.dart';
import 'package:brandslabels/app/presentation/screens/teams_condition/teams_condition.dart';
import 'package:brandslabels/app/presentation/screens/teams_condition/teams_condition_binding.dart';
import 'package:brandslabels/app/presentation/screens/track_ticket_list/trace_my_ticket_screen.dart';
import 'package:brandslabels/app/presentation/screens/track_ticket_list/track_ticket_binding.dart';
import 'package:brandslabels/app/presentation/screens/track_your_order/track_your_order_binding.dart';
import 'package:brandslabels/app/presentation/screens/track_your_order/track_your_order_screen.dart';
import 'package:brandslabels/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_binding.dart';
import 'package:brandslabels/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_screen.dart';
import 'package:brandslabels/app/presentation/screens/wishlist/wishlist_binding.dart';
import 'package:brandslabels/app/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:get/get.dart';

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
      page: () => const ShippingScreen(),
      binding: ShippingBinding(),
    ),
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.forgotPasswordPage,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordMenuBinding(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => const SearchScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: RoutesConstants.brandScreen,
      page: () => BrandListPage(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: RoutesConstants.filterScreen,
      page: () => const ListFilterPage(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreen,
      page: () => const MyAccountInformationScreen(),
      binding: MyAccountInformationBinding(),
    ),
    GetPage(
      name: RoutesConstants.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBindings(),
    ),
    GetPage(
      name: RoutesConstants.wishlistScreen,
      page: () => const MyWishListPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesConstants.checkoutOrderScreen,
      page: () => CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => CountryScreen(),
      binding: CountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesConstants.myOrderScreen,
      page: () => const MyOrdersScreen(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: RoutesConstants.myTicketScreen,
      page: () => const MyTicketPageScreen(),
      binding: MyTicketsBindings(),
    ),
    GetPage(
      name: RoutesConstants.charityScreen,
      page: () => const CharityScreen(),
      binding: CharityBinding(),
    ),
    GetPage(
      name: RoutesConstants.orderConfirmationScreen,
      page: () => const OrderConfirmationPage(),
      binding: OrderConfirmationBinding(),
    ),
    GetPage(
      name: RoutesConstants.affiliateProgramScreen,
      page: () => const AffiliateProgramScreen(),
      binding: AffiliateProgramBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => const InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationThankyouScreen,
      page: () => const InfluencerRegistrationThankYouScreen(),
      //binding: InfluencerRegistrationThankyouBindings(),
    ),
    GetPage(
      name: RoutesConstants.searchScreen,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: RoutesConstants.returnsAndRefundsScreen,
      page: () => const ReturnsAndRefundsScreen(),
      binding: ReturnsAndRefundsBinding(),
    ),
    GetPage(
      name: RoutesConstants.contactUsScreen,
      page: () => ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.referFriendScreen,
      page: () => const ReferFriendScreen(),
      binding: ReferFriendBindings(),
    ),
    GetPage(
      name: RoutesConstants.registerScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: RoutesConstants.specialSizeRequestScreen,
      page: () => const SpecialSizeRequestScreen(),
      binding: SpecialSizeRequestBinding(),
    ),
    GetPage(
      name: RoutesConstants.faqScreen,
      page: () => const FaqScreen(),
      binding: FaqBindings(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.productDetailScreen,
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
      name: RoutesConstants.teamsConditionScreen,
      page: () => const TeamsConditionScreen(),
      binding: TeamsConditionBindings(),
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
      name: RoutesConstants.myAddressScreen,
      page: () => const MyAddressScreen(),
      binding: MyAddressBinding(),
    ),
    GetPage(
      name: RoutesConstants.addAddressScreen,
      page: () => const AddAddressScreen(),
      binding: AddAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.orderDetailScreen,
      page: () => const OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.specialRequestScreen,
      page: () => const SpecialRequestScreen(),
      binding: SpecialRequestBinding(),
    ),
    GetPage(
      name: RoutesConstants.myCouponsScreen,
      page: () => const MyCouponsScreen(),
      binding: MyCouponsBindings(),
    ),
    GetPage(
      name: RoutesConstants.requestReceivedScreen,
      page: () => const RequestReceivedScreen(),
    ),
    GetPage(
      name: RoutesConstants.emailPasswordInvalidScreen,
      page: () => const EmailPasswordInvalidScreen(),
    ),
    GetPage(
      name: RoutesConstants.traceYourTicketMail,
      page: () => const TraceYourTicketMail(),
      binding: TrackYourTicketEmailBinding(),
    ),
    GetPage(
      name: RoutesConstants.trackTicketScreen,
      page: () => const TrackTicketScreen(),
      binding: TrackTicketListBinding(),
    ),
    GetPage(
      name: RoutesConstants.trackYourOrderScreen,
      page: () => const TrackYourOrderScreen(),
      binding: TrackYourOrderBinding(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnsScreen,
      page: () => const GuestReturnsScreen(),
      binding: GuestReturnsBinding(),
    ),
  ];
}
