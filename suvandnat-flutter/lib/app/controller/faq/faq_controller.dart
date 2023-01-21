import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/faq/faq_model.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/presentation/common_widget/common_message/validator.dart';
import '../../data/api/api_endpoint/about_api.dart';

class FaqController extends GetxController {
  TextEditingController feqText = TextEditingController();
  RxInt index = 0.obs;
  var isLoadding = true.obs;
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FaqController();

  RxList<CmsText> getFaqList = RxList<CmsText>();

  @override
  void onInit() {
    super.onInit();
    getFaqContent();
  }

  void getFaqContent() async {
    try {
      isLoadding.value = true;
      FaqModel itemsData =
          await aboutAPIRepository.getFaqApiResponse(endpoint: AboutApi.faq);
      getFaqList.value = itemsData.cmsText ?? [];
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      isLoadding.value = false;
      Validators.appCatchError(error: e);
    } finally {
      isLoadding.value = false;
    }
  }
}
