import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/home_api_repository.dart';
import 'package:meta_package/api/models/home/home_page_manager_response_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/main/main.common.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  RxInt index = 0.obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  RxDouble height = 25.0.obs;

  RxBool isLoading = true.obs;
  RxList<HomePageManagerResponseModel> homePageManagerResponseModel =
      <HomePageManagerResponseModel>[].obs;

  final HomeAPIRepository homePageManagerRepository =
      HomeAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  HomeController();

  @override
  Future<void> onInit() async {
    debugPrint('DATA object');
    getMenuDataFromApi();
    await localStore.getUserDetail();
    super.onInit();
  }

  Future<void> getMenuDataFromApi() async {
    try {
      homePageManagerResponseModel.value = [];

      isLoading.value = true;
      List<HomePageManagerResponseModel> homeData =
          await homePageManagerRepository.getHomeMenuAPIResponse();
      if (homeData.isNotEmpty == true) {
        homePageManagerResponseModel.value = homeData;
      }
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoading.value = false;
      Validators.appCatchError(error: e);
    } finally {
      isLoading.value = false;
    }
  }
}
