import 'dart:developer';

import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/meta_package.dart';
import 'package:solo_luxury/all_imports.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  RxBool isLoading = true.obs;
  Rx<MenuModel>? menuModel = MenuModel().obs;
  Rx<ProductModel>? productModel = ProductModel().obs;
  RxList<ProductModel?> homeTileModel = RxList();

  final ProductListAPIRepository productListAPIRepository =
      ProductListAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  final MenuAPIRepository menuAPIRepository =
      MenuAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  @override
  void onInit() async {
    super.onInit();
    await localStore.getUserDetail();
    getMenuDataFromApi();
  }

  Future<void> getMenuDataFromApi() async {
    isLoading(true);
    debugPrint("CONTROLLER DATA ==============$menuModel");
    try {
      MenuModel data = await menuAPIRepository.getMenuAPISearchResponse();
      data.childrenData!.forEach((element) async {
        homeTileModel.value
            .add(await getHomeProducts(element.id.toString(), false));
        homeTileModel.refresh();
      });

      menuModel?.value = data;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
  }

  Future<ProductModel?> getHomeProducts(String val, bool isBrand) async {
    try {
      ProductModel productModelData =
          await productListAPIRepository.getProductListApiResponse(val, isBrand,
              currentPage: 0,
              pageSize: 10,
              currentCurrency: localStore.currentCurrency);
      productModel?.value = productModelData;
      return productModelData;

      // isLoading.value = false;
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "error");
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
