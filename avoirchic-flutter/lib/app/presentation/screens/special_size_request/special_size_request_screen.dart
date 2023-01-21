import 'package:avoirchic/app/controller/special_size_request_controller.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SpecialSizeRequestScreen extends GetView<SpecialSizeRequestController> {
  const SpecialSizeRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              key: controller.scaffoldKey2.value,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                    child: SvgPicture.asset(
                      AppAsset.menuIcon,
                      color: Colors.black26,
                      height: 10,
                    ),
                  ),
                ),
                centerTitle: false,
                title: Text(
                  LanguageConstants.appnameText.tr,
                  style: AppTextStyle.textStyleUtils400(color: Colors.black38),
                ),
                actions: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: SvgPicture.asset(
                        AppAsset.search,
                        color: const Color(0xff367587).withOpacity(0.8),
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                        child: Image.asset(
                          AppAsset.signInIcon,
                          height: 16,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // controller.scaffoldKey.value.currentState?.openDrawer();
                    },
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                        child: Image.asset(
                          AppAsset.myacountIcon,
                          height: 16,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // controller.scaffoldKey.value.currentState?.openDrawer();
                    },
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                        child: Image.asset(
                          AppAsset.bagIcon,
                          height: 16,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(2.0),
                  child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.black38),
                ),
              ),
              drawer: const Drawer(),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.showDialogBoxOpen(context);
                          },
                          child: Text(LanguageConstants.popupBox.tr),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 1.0,
                            width: double.infinity,
                            color: const Color(0xFF367587)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            LanguageConstants.specialSizeCompanyText.tr,
                            style: AppTextStyle.textStyleUtils400_16(
                                color: blue367587),
                          ),
                        ),
                        Container(
                            height: 1.0,
                            width: double.infinity,
                            color: const Color(0xFFE4DAC9)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            LanguageConstants.specialSizeContactText.tr,
                            style: AppTextStyle.textStyleUtils400_16(
                                color: blue367587),
                          ),
                        ),
                        Container(
                            height: 1.0,
                            width: double.infinity,
                            color: const Color(0xFFE4DAC9)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            LanguageConstants.specialSizeOtherText.tr,
                            style: AppTextStyle.textStyleUtils400_16(
                                color: blue367587),
                          ),
                        ),
                        Container(
                            height: 1.0,
                            width: double.infinity,
                            color: const Color(0xFFE4DAC9)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            LanguageConstants
                                .specialSizeSubscribeToNewsletterText.tr,
                            style: AppTextStyle.textStyleUtils400_16(
                                color: blue367587),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 30.0,
                            bottom: 10.0,
                          ),
                          child: TextField(
                            controller: null,
                            autofocus: false,
                            style: AppTextStyle.textStyleUtils400(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: LanguageConstants
                                  .specialSizeEmailAddressText.tr,
                              hintStyle: AppTextStyle.textStyleUtils400_12(),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  color: const Color(0xFF367587),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        LanguageConstants
                                            .specialSizeSubscribeText.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
