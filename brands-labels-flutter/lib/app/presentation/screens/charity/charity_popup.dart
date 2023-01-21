import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/charity_popup_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:brandslabels/app/theme/colors.dart';

class CharityPopUp extends GetView<CharityPopUpController> {
  const CharityPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharityPopUpController());

    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height / 7.2,
            iconTheme: const IconThemeData(color: Colors.black),
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 34,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xff000080)),
                    child: Text(
                      LanguageConstants.exploreText.tr,
                      style:
                          AppTextStyle.textStyleUtils400(color: Colors.white),
                    )),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAsset.drawerIcon,
                            height: 30,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(AppAsset.brandsLabelsLogo, height: 40),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAsset.searchIcon,
                            height: 22,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(AppAsset.userIcon, height: 22),
                          const SizedBox(width: 10),
                          Image.asset(AppAsset.heartIcon, height: 22),
                          const SizedBox(width: 10),
                          Image.asset(AppAsset.bagIcon, height: 22),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2.0),
              child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: const Color(0xff222291)),
            ),
          ),
          drawer: const Drawer(),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _showDialog(
                          context,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(LanguageConstants.addNew.tr,
                            style: AppTextStyle.textStyleUtils500_16(
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  //Add To Cart Open Dialog3
  void _showDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(() => Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              child: dialogContent(
                context,
              ),
            ));
      },
    );
  }
}

Widget dialogContent(
  BuildContext context,
) {
  final controller = Get.put(CharityPopUpController());
  return SingleChildScrollView(
    child: Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(0.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 22,
                        color: darkBlue,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.textDonationText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtils700_16().copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text(
                    LanguageConstants.youAddedTestText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.selectedAmount = 5.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: controller.selectedAmount.value == 5
                                ? const Color(0xff000080)
                                : Colors.black26),
                        child: Text(
                          LanguageConstants.e5Text.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: controller.selectedAmount.value == 5
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectedAmount = 10.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: controller.selectedAmount.value == 10
                              ? const Color(0xff000080)
                              : Colors.black26,
                        ),
                        child: Text(
                          LanguageConstants.e10Text.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: controller.selectedAmount.value == 10
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectedAmount = 15.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: controller.selectedAmount.value == 15
                              ? const Color(0xff000080)
                              : Colors.black26,
                        ),
                        child: Text(
                          LanguageConstants.e15Text.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: controller.selectedAmount.value == 15
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectedAmount = 20.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: controller.selectedAmount.value == 20
                              ? const Color(0xff000080)
                              : Colors.black26,
                        ),
                        child: Text(
                          LanguageConstants.e20Text.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: controller.selectedAmount.value == 20
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        controller.selectedAmount.value = 25;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: controller.selectedAmount.value == 25
                              ? const Color(0xff000080)
                              : Colors.black26,
                        ),
                        child: Text(
                          LanguageConstants.e25Text.tr,
                          style: AppTextStyle.textStyleUtils500(
                              color: controller.selectedAmount.value == 25
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Text(
                  LanguageConstants.chooseYourOwmText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const SizedBox(height: 12.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        color: Colors.black26,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              LanguageConstants.gbpText.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 26,
                              width: 2,
                              color: Colors.black26,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: controller.gbpTextController(),
                            cursorColor: darkBlue,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              contentPadding: const EdgeInsets.only(
                                  bottom: 8, top: 8, left: 10),
                              hintText: "",
                              labelStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.black54),
                              errorStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.black),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              isDense: true,
                              border: InputBorder.none,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.theSelectedAmountText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000080))),
                  child: Text(
                    LanguageConstants.iwantToDonateText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils500(
                      color: const Color(0xff000080),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
