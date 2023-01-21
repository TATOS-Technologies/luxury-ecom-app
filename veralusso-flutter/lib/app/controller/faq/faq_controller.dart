import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/faq/faq_model.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/data/api/api_endpoint/about_api.dart';

import '../../presentation/common_widget/common_message/validator.dart';

class FaqController extends GetxController {
  RxInt index = 0.obs;

  RxList<CmsText> getFaqList = RxList<CmsText>();
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FaqController();

  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getFaqContent();
  }

  void getFaqContent() async {
    loading.value = true;
    try {
      FaqModel itemsData =
          await aboutAPIRepository.getFaqApiResponse(endpoint: AboutApi.faq);
      debugPrint("ITEAM DATA +++++++++++++++${itemsData.cmsText?.length}");
      getFaqList.value = itemsData.cmsText ?? [];
      debugPrint("ITEAM DATA +++++++++++++++${getFaqList.length}");
    } on ApiException catch (e) {
      Validators.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      Validators.appCatchError(error: e);
    }
    loading.value = false;
  }
}
