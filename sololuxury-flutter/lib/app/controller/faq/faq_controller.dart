import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/models/faq/faq_model.dart';
import 'package:solo_luxury/all_imports.dart';

class FaqController extends GetxController {
  TextEditingController feqText = TextEditingController();

  RxInt index = 0.obs;

  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);
  RxList<CmsText> getFaqList = RxList<CmsText>();

  FaqController();

  @override
  void onInit() {
    super.onInit();
    getFaqContent();
  }

  Future<void> getFaqContent() async {
    try {
      FaqModel? itemsData = await aboutAPIRepository.getFaqApiResponse();
      if (itemsData.cmsText?.isNotEmpty == true) {
        getFaqList.value = itemsData.cmsText ?? [];
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      log(e.toString(), name: "Error");
      ExceptionHandler.appCatchError(error: e);
    } finally {}
  }
}
