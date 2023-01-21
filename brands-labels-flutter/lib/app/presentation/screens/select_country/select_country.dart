import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/select_country_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SelectCountryScreen extends GetView<SelectCountryController> {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectCountryController controller = Get.find<SelectCountryController>();
    return Obx(() => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  AppAsset.brandsLabelsLogo,
                ),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 10.0),
                    child: SvgPicture.asset(
                      AppAsset.menuIcon,
                      color: Colors.black,
                      width: 18,
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 8.0),
                    child: SvgPicture.asset(
                      AppAsset.search,
                      color: Colors.black,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                  child: Image.asset(
                    AppAsset.userIcon,
                    height: 20,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 8.0),
                    child: SvgPicture.asset(
                      AppAsset.cart,
                      color: Colors.black,
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 4.0),
                    child: Text(
                      LanguageConstants.gdpText.tr.toUpperCase(),
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 4.0),
                    child: Text(
                        "| ${LanguageConstants.engText.tr.toUpperCase()} |")),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                  child: Image.asset(
                    AppAsset.indianFlag,
                    height: 20,
                  ),
                ),
              ],
            ),
            body: controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Color(0xff000080),
                    ),
                  )
                : ListView(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(
                        LanguageConstants.chooseCountryText.tr.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtilsUnderLine18(
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3.5,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: controller.getcountryList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              height: 60,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller
                                          .getcountryList[index].fullNameEnglish
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 60),
                  ]),
          ),
        ));
  }
}
