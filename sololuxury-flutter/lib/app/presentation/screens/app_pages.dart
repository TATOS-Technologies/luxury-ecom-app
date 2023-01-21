import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/Guest_Returns/guest_returns_binding.dart';
import 'package:solo_luxury/app/presentation/screens/Guest_Returns/guest_returns_screen.dart';
import 'package:solo_luxury/app/presentation/screens/add_address/add_address.dart';
import 'package:solo_luxury/app/presentation/screens/add_address/add_address_binding.dart';
import 'package:solo_luxury/app/presentation/screens/address_book/address_book.dart';
import 'package:solo_luxury/app/presentation/screens/address_book/address_book_binding.dart';
import 'package:solo_luxury/app/presentation/screens/affiliate_program/affiliate_program_bindings.dart';
import 'package:solo_luxury/app/presentation/screens/affiliate_program/affiliate_program_screen.dart';
import 'package:solo_luxury/app/presentation/screens/app_secure_shopping/app_secure_shopping.dart';
import 'package:solo_luxury/app/presentation/screens/app_secure_shopping/app_secure_shopping_binding.dart';
import 'package:solo_luxury/app/presentation/screens/cart/cart_binding.dart';
import 'package:solo_luxury/app/presentation/screens/cart/cart_screen.dart';
import 'package:solo_luxury/app/presentation/screens/checkout_order/checkout_order_screen.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/contact_us_binding.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:solo_luxury/app/presentation/screens/contact_us/contact_us_submission_screen.dart';
import 'package:solo_luxury/app/presentation/screens/country/country_binding.dart';
import 'package:solo_luxury/app/presentation/screens/country/country_screen.dart';
import 'package:solo_luxury/app/presentation/screens/country_screen/country_screen.dart';
import 'package:solo_luxury/app/presentation/screens/country_screen/country_screen_binding.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/dashboard_binding.dart';
import 'package:solo_luxury/app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:solo_luxury/app/presentation/screens/donation/charity_binding.dart';
import 'package:solo_luxury/app/presentation/screens/donation/donation_screen.dart';
import 'package:solo_luxury/app/presentation/screens/faq/faq_binding.dart';
import 'package:solo_luxury/app/presentation/screens/faq/faq_screen.dart';
import 'package:solo_luxury/app/presentation/screens/filter/filter_binding.dart';
import 'package:solo_luxury/app/presentation/screens/filter/list_filter.dart';
import 'package:solo_luxury/app/presentation/screens/influencer_registraction/influencer_binding.dart';
import 'package:solo_luxury/app/presentation/screens/influencer_registraction/influencer_registration_screen.dart';
import 'package:solo_luxury/app/presentation/screens/influencer_registraction_thankyou/influencer_registration_thankyou_screen.dart';
import 'package:solo_luxury/app/presentation/screens/login/bindings/forget_password_menu_binding.dart';
import 'package:solo_luxury/app/presentation/screens/login/bindings/login_binding.dart';
import 'package:solo_luxury/app/presentation/screens/login/bindings/signup_bindings.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/email_password_invalid_screen.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/forgot_password.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/login_screen.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/logout_success_screen.dart';
import 'package:solo_luxury/app/presentation/screens/login/views/signup_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/change_password_binding.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/change_password_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/my_account_information_binding.dart';
import 'package:solo_luxury/app/presentation/screens/my_account/my_account_information_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_coupons/my_coupons_binding.dart';
import 'package:solo_luxury/app/presentation/screens/my_coupons/my_coupons_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_orders/order_details_screen/order_details_binding.dart';
import 'package:solo_luxury/app/presentation/screens/my_orders/order_details_screen/order_details_screen.dart';
import 'package:solo_luxury/app/presentation/screens/my_tickets/my_tickets_binding.dart';
import 'package:solo_luxury/app/presentation/screens/my_tickets/my_tickets_screen.dart';
import 'package:solo_luxury/app/presentation/screens/news_letter/news_letter_screen.dart';
import 'package:solo_luxury/app/presentation/screens/order_confirmation/order_confirmation_binding.dart';
import 'package:solo_luxury/app/presentation/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:solo_luxury/app/presentation/screens/privacy_policy/privacy_policy_binding.dart';
import 'package:solo_luxury/app/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:solo_luxury/app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:solo_luxury/app/presentation/screens/refer_friend/refer_friend_binding.dart';
import 'package:solo_luxury/app/presentation/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/presentation/screens/returns_and_refunds/returns_and_refunds_binding.dart';
import 'package:solo_luxury/app/presentation/screens/returns_and_refunds/returns_and_refunds_screen.dart';
import 'package:solo_luxury/app/presentation/screens/selecet_country/select_country.dart';
import 'package:solo_luxury/app/presentation/screens/selecet_country/select_country_binding.dart';
import 'package:solo_luxury/app/presentation/screens/shipping/shipping_binding.dart';
import 'package:solo_luxury/app/presentation/screens/shipping/shipping_screen.dart';
import 'package:solo_luxury/app/presentation/screens/special_request/request_received_screen.dart';
import 'package:solo_luxury/app/presentation/screens/special_request/special_reques_binding.dart';
import 'package:solo_luxury/app/presentation/screens/special_request/special_request_screen.dart';
import 'package:solo_luxury/app/presentation/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/presentation/screens/splash/splash_screen.dart';
import 'package:solo_luxury/app/presentation/screens/store_credit/store_credit.dart';
import 'package:solo_luxury/app/presentation/screens/store_credit/store_credit_binding.dart';
import 'package:solo_luxury/app/presentation/screens/teams_condition/tems_condition_binding.dart';
import 'package:solo_luxury/app/presentation/screens/teams_condition/tems_condition_screen.dart';
import 'package:solo_luxury/app/presentation/screens/track_ticket_list/trace_my_ticket_screen.dart';
import 'package:solo_luxury/app/presentation/screens/track_ticket_list/track_ticket_binding.dart';
import 'package:solo_luxury/app/presentation/screens/track_your_order/track_your_order_binding.dart';
import 'package:solo_luxury/app/presentation/screens/track_your_order/track_your_order_screen.dart';
import 'package:solo_luxury/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_binding.dart';
import 'package:solo_luxury/app/presentation/screens/track_your_ticket_mail/trace_your_ticket_mail_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.newsLetterScreen,
      page: () => NewsLetterScreen(),
      // binding: NewsLetterBinding(),
    ),
    GetPage(
      name: RoutesConstants.logoutSuccess,
      page: () => const LogOutSuccess(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.shippingScreen,
      page: () => const ShippingScreen(),
      binding: ShippingBinding(),
    ),
    GetPage(
      name: RoutesConstants.trackYourOrderScreen,
      page: () => const TrackYourOrderScreen(),
      binding: TrackYourOrderBinding(),
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
      name: RoutesConstants.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
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
      name: RoutesConstants.myOrderScreen,
      page: () => const MyOrdersScreen(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: RoutesConstants.faqScreen,
      page: () => const FaqScreen(),
      binding: FaqBindings(),
    ),
    GetPage(
      name: RoutesConstants.addAdressScreen,
      page: () => const AddAddressScreen(),
      binding: AddAddressBindings(),
    ),
    GetPage(
      name: RoutesConstants.appSecureShoppingScreen,
      page: () => const AppSecureShoppingScreen(),
      binding: AppSecureShoppingBindings(),
    ),
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.signUpScreen,
      page: () => const SignupScreen(),
      binding: SignupBinding(),
    ),
    /*  GetPage(
      name: RoutesConstants.forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),*/
    GetPage(
      name: RoutesConstants.orderConfirmScreen,
      page: () => const OrderConfirmationPage(),
      binding: OrderConfirmationBinding(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.specialRequesScreen,
      page: () => const SpecialRequestScreen(),
      binding: SpecialRequestBinding(),
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
      name: RoutesConstants.forgotPasswordMenuPage,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordMenuBinding(),
    ),
    GetPage(
      name: RoutesConstants.filterScreen,
      page: () => const ListFilterPage(),
      binding: FilterBinding(),
    ),
    GetPage(
      name: RoutesConstants.charityScreen,
      page: () => const CharityScreen(),
      binding: CharityBinding(),
    ),
    GetPage(
      name: RoutesConstants.brandScreen,
      page: () => const BrandListPage(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => const InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.affiliateProgramScreen,
      page: () => const AffiliateProgramScreen(),
      binding: AffiliateProgramBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountMenuScreen,
      page: () => const MyAccountMenuPage(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.myTicketsScreen,
      page: () => const MyTicketScreen(),
      binding: MyTicketsBindings(),
    ),
    GetPage(
      name: RoutesConstants.myCouponsScreen,
      page: () => const MyCouponsScreen(),
      binding: MyCouponsBindings(),
    ),
    GetPage(
      name: RoutesConstants.selectCountryScreen,
      page: () => const SelectCountryScreen(),
      binding: SelectCountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.storeCreditScreen,
      page: () => const StoreCreditScreen(),
      binding: StoreCreditBindings(),
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
      name: RoutesConstants.returnsAndRefundsScreen,
      page: () => const ReturnsAndRefundsScreen(),
      binding: ReturnsAndRefundsBinding(),
    ),
    GetPage(
      name: RoutesConstants.addressBookScreen,
      page: () => const AddressBookScreen(),
      binding: AddressBookBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryScreen,
      page: () => CountryScreen(),
      binding: CountryBindings(),
    ),
    GetPage(
      name: RoutesConstants.countryPopUpScreen,
      page: () => const CountryPopUpScreen(),
      binding: CountryPopUpScreenBindings(),
    ),
    GetPage(
      name: RoutesConstants.guestReturnsScreen,
      page: () => const GuestReturns(),
      binding: GuestReturnsBindings(),
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
      name: RoutesConstants.contactUsScreen,
      page: () => const ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.contactUsSubmissionScreen,
      page: () => const ContactUsSubmissionScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: RoutesConstants.myTickets,
      page: () => const MyTicketScreen(),
      binding: MyTicketsBindings(),
    ),
    GetPage(
      name: RoutesConstants.referFriendScreen,
      page: () => const ReferFriendScreen(),
      binding: ReferFriendBindings(),
    ),
    GetPage(
      name: RoutesConstants.brandDetailsScreen,
      page: () => const BrandDetailsPage(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: RoutesConstants.privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: RoutesConstants.teamsConditionScreen,
      page: () => const TermAndConditionScreen(),
      binding: TermAndConditionBinding(),
    ),
    GetPage(
      name: RoutesConstants.orderDetailsScreen,
      page: () => const OrderDetailsScreen(),
      binding: OrderDetailsBinding(),
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
        page: () => const TrackTicketScreen(),
        binding: TrackTicketListBinding()),
  ];
}
