import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/my_account/my_account_model.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../presentation/screens/cart/widget/show_title_dialog.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController>? tabController;
  final formKey = GlobalKey<FormState>();
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<MenuModel>? menuModel = MenuModel().obs;
  RxString appbarTitle = "".obs;
  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  DashboardController();

  MyAccountDetails userDetail = MyAccountDetails();
  var isConnected = false.obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this).obs;
    await localStore.getUserDetail();
    userDetail = localStore.userDetail;
    HomeBindings().dependencies();
    SearchBinding().dependencies();
    BrandBinding().dependencies();
    WishlistBindings().dependencies();
    MyAccountBinding().dependencies();
    ProductListBinding().dependencies();
    ProfileBindings().dependencies();
    MyOrdersBinding().dependencies();
    ProductDetailsBindings().dependencies();
    CheckoutOrderBindings().dependencies();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    getMenuDataFromApi();
    tabController?.value.addListener(() {
      tabController?.refresh();
      appbarTitle.refresh();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> getMenuDataFromApi() async {
    debugPrint("getMenuDataFromApi -> ");
    //menuModel?.value = await NetworkRepository().getMenu();
    try {
      MenuModel data = await menuAPIRepository.getMenuAPIResponse();
      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }

  List<String> data = [
    "ENG",
    "EUR",
  ];

  void clickChatEvent({String? name, String? email, BuildContext? context}) {
    showTitleDialog(context ?? Get.context!);
  }

  Future<void> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    _updateConnectionStatus(connectivityResult);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile) {
      debugPrint('mobile');
      isConnected.value = true;
    } else if (result == ConnectivityResult.wifi) {
      debugPrint('wifi');
      isConnected.value = true;
    } else {
      debugPrint('no');
      isConnected.value = false;
    }

    isConnected.refresh();
  }
}
