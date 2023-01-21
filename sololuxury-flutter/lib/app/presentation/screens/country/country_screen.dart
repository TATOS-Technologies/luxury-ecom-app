import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/country/widget/dialog_content.dart';

import '../../../core/const/app_style.dart';

class CountryScreen extends StatelessWidget {
  CountryScreen({Key? key}) : super(key: key);
  final MyAccountController myAccountController =
  Get.find<MyAccountController>();

  final CountryController controller = Get.find<CountryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          key: controller.scaffoldkey,
          appBar: commonAppbar(
              title: LanguageConstants.changeLanguageAndCurrency.tr),
          backgroundColor: homeBackground,
          body: SizedBox(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10,
                      ),
                      child: TextFormFieldWidget(
                        controller: controller.searchController,
                        keyboardType: TextInputType.name,
                        hintText: LanguageConstants.searchCountry.tr,
                        hintStyle:
                        AppStyle.textStyleUtils400(color: blackColor),
                        onChanged: (value) {
                          controller.countryOnChanged(value);
                        },
                        maxLength: 20,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: controller.searchCountryList.isNotEmpty
                          ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.all(24.w),
                        itemCount: controller.searchCountryList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () async {
                                controller.isChangeCurrency.value = false;
                                await controller.setLanguageAndCurrency(
                                    controller.searchCountryList[index],
                                    false);

                                showDialog<dynamic>(
                                  context: Get.context!,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        backgroundColor:
                                        Colors.transparent,
                                        insetPadding:
                                        const EdgeInsets.all(10),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: double.infinity,
                                              color:
                                              appSubscribeButtonColor,
                                              padding:
                                              const EdgeInsets.all(
                                                  20.0),
                                              child: DialogContent(
                                                item: controller
                                                    .searchCountryList[
                                                index],
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 20.w, bottom: 20.w),
                                child: CommonTextPoppins(
                                  controller.searchCountryList[index]
                                      .name ??
                                      "",
                                  fontSize: 16.sp,
                                ),
                              ));
                        },
                      )
                          : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  LanguageConstants
                                      .noCountryMatches.tr,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleUtils400(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.offAndToNamed<dynamic>(
                                      RoutesConstants.dashboardScreen);
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
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
