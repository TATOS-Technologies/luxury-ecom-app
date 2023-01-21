import 'package:avoirchic/app/core/consts/app_constants.dart';
import 'package:avoirchic/app/data/api/api_endpoint/about_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/faq/faq_model.dart';

import '../presentation/common_widgets/common_widget/common_message/validator.dart';

class FaqController extends GetxController {
  var faqContentData = ''.obs;
  var faqContentDetails = <FaqModel>[].obs;
  RxInt index = 0.obs;

  TextEditingController feqText = TextEditingController();

  RxBool loading = false.obs;
  RxList<CmsText> getFaqList = RxList<CmsText>();
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FaqController();

  @override
  void onInit() {
    super.onInit();
    getFaqContent();
  }

  Future<void> getFaqContent() async {
    loading.value = true;
    try {
      FaqModel itemsData =
          await aboutAPIRepository.getFaqApiResponse(endpoint: AboutApi.faq);
      if (itemsData.cmsText?.isNotEmpty == true) {
        getFaqList.value = itemsData.cmsText ?? [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
    loading.value = false;
  }
}
