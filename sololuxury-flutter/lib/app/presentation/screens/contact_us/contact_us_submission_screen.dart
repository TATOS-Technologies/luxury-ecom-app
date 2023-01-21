import 'package:solo_luxury/all_imports.dart';
// import 'package:solo_luxury/presentation/screens/dashboard/dashboard_screen.dart';

class ContactUsSubmissionScreen extends GetView<ContactUsController> {
  const ContactUsSubmissionScreen({Key? key}) : super(key: key);

  // final CountryController countryController = Get.put(CountryController(countryAPIRepository: Get.put(CountryAPIRepository(countryAPIProvider: CountryAPIProvider()))));

  @override
  Widget build(BuildContext context) {
    // DashboardController dashboardController = Get.find<DashboardController>();
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundColorValue.value,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backGroundColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: Get.height / 4.5),
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        LanguageConstants.weWillGetInTouchSoon.tr,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: CommonTextPoppins(
                          LanguageConstants.weHaveReceivedYourRequest.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: CommonTextPoppins(
                          LanguageConstants.and.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: CommonTextPoppins(
                          LanguageConstants.weWillGetInTouchSoon.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CommonTextPoppins(
                          LanguageConstants
                              .youCanViewResponsesOnYourEmailText.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: CommonTextPoppins(
                          '&',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: CommonTextPoppins(
                          LanguageConstants.underMyTicketsText.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // dashboardController.scaffoldkey = GlobalKey();
                                // dashboardController.update();
                                // Get.to<dynamic>(() => DashboardScreen());
                                Get.offAllNamed<dynamic>(
                                    RoutesConstants.dashboardScreen);

                                // Get.toNamed<dynamic>(RoutesConstants.dashboardScreen);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: appColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: CommonTextOpenSans(
                                LanguageConstants.continueShopping.tr,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            localStore.isGuest
                                ? ElevatedButton(
                                    onPressed: () {
                                      Get.offAndToNamed<dynamic>(
                                          RoutesConstants.loginScreen);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      backgroundColor: appColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: CommonTextOpenSans(
                                      LanguageConstants.loginText.tr,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.5,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
