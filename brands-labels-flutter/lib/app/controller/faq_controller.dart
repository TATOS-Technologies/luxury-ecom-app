import 'package:brandslabels/app/core/consts/app_constants.dart';
import 'package:brandslabels/app/data/api/api_endpoint/about_api.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_message/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/about_api_repository.dart';
import 'package:meta_package/api/models/faq/faq_model.dart';

class FaqController extends GetxController {
  var faqContentData = ''.obs;
  var faqContentDetails = <FaqModel>[].obs;
  Rx<FaqModel>? faqModel = FaqModel().obs;
  RxInt index = 0.obs;
  List itemsData = [];
  RxList<CmsText> getFaqList = RxList<CmsText>();
  final AboutAPIRepository aboutAPIRepository =
      AboutAPIRepository(baseUrl: AppConstants.apiEndPointLogin);

  FaqController();

  @override
  void onInit() {
    super.onInit();
    getFaqContent();
  }

  void getFaqContent() async {
    try {
      FaqModel itemsData =
          await aboutAPIRepository.getFaqApiResponse(endpoint: AboutApi.faq);
      if (itemsData.cmsText?.isNotEmpty == true) {
        debugPrint("ITEAM DATA +++++++++++++++${itemsData.cmsText?.length}");
        getFaqList.value = itemsData.cmsText!;
        debugPrint("ITEAM DATA +++++++++++++++${getFaqList.length}");
      }
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    }
  }
}
