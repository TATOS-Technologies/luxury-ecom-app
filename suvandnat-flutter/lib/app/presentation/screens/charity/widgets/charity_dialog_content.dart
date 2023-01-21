import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/charity/charity_popup_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class CharityDialogContent extends GetView<CharityPopUpController> {
  const CharityDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xffd1f2ff),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.testDonationText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtilsUnderLine16(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  color: const Color(0xff63AAC9),
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    LanguageConstants.youAddedTestText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.selectedAmount = 5.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff973133)),
                            color: controller.selectedAmount.value == 5
                                ? const Color(0xff973133)
                                : Colors.transparent),
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
                                ? const Color(0xff973133)
                                : Colors.transparent,
                            border: Border.all(color: const Color(0xff973133))),
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
                              ? const Color(0xff973133)
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xff973133)),
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
                              ? const Color(0xff973133)
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xff973133)),
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
                              ? const Color(0xff973133)
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xff973133)),
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
                  child: TextFormField(
                    controller: null,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(
                            bottom: 12, top: 12, left: 10),
                        hintText: "",
                        labelStyle: AppTextStyle.textStyleUtils400(
                            color: Colors.black54),
                        errorStyle:
                            AppTextStyle.textStyleUtils400(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Color(0xff973133),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          borderSide: const BorderSide(
                            color: Color(0xff973133),
                            width: 1.0,
                          ),
                        ),
                        prefixIcon: SizedBox(
                          height: 40,
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
                        isDense: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff973133),
                            ),
                            borderRadius: BorderRadius.circular(0.0))),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.theSelectedAmountText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14.0),
                Text(
                  LanguageConstants.iwantToDonateText.tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtilsUnderLine14(
                      color: const Color(0xff973133),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
