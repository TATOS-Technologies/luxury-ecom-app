import 'dart:developer';

import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/api_repository/newsletter_api_respository.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import 'widgets/check_box_container.dart';

class NewsLetterScreen extends StatelessWidget {
  NewsLetterScreen({Key? key}) : super(key: key);
  final NewsletterApiRepository newsletterAPIRepository =
      NewsletterApiRepository(baseUrl: AppConstants.apiEndPointLogin);

  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: SafeArea(
          child: Container(
            color: appColorAccent,
            padding: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top,
                left: 10.0,
                right: 15.0,
                bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Image.asset(
                  AppAsset.logo,
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed<dynamic>(RoutesConstants.cartScreen);
                  },
                  child: SvgPicture.asset(
                    AppAsset.cart,
                    height: 20.0,
                    width: 20.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LanguageConstants.communicationPreference.tr,
            style: AppStyle.textStyleUtils500(size: 18, color: appColorButton)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            LanguageConstants.subscribeToBeTheFirstText.tr,
            style: AppStyle.textStyleUtils400(size: 13.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.subscribeToNewsletters.tr,
            style: AppStyle.textStyleUtils400_12(
                color: Colors.black.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            child: CheckBoxContainer(LanguageConstants.email.tr),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() => isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(
                    color: appColor,
                  ),
                )
              : Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appColorButton),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: MaterialButton(
                      onPressed: () {
                        subscribeNewsLetter();
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        LanguageConstants.saveText.tr,
                        style: AppStyle.textStyleUtils400(
                            size: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ))
        ],
      ),
    );
  }

  Future<void> subscribeNewsLetter() async {
    isLoading.value = true;
    try {
      await newsletterAPIRepository.subscribeNewsLetter();
      Get.back();
      log('', name: "Value");
    } on ApiException catch (e) {
      ExceptionHandler.apiExceptionError(e: e);
    } catch (e) {
      debugPrint(e.toString());
      ExceptionHandler.appCatchError(error: e);
    } finally {
      isLoading(false);
    }
    isLoading.value = false;
  }
}
