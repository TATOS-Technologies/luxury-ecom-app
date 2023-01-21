import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';

import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: commonAppbar(appBarColor: Colors.transparent,title: LanguageConstants.helpTheNeedyText.tr),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(top: 13.0, right: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                   
                    Container(
                      //color: blackColor,
                      padding: const EdgeInsets.all(14),
                      child: Text(LanguageConstants.youAddedTestText.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.textStyleUtils400()),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            //controller.selectedAmount = 5.obs;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff367587)),
                              color: /*controller.selectedAmount.value == 5
                                  ? Color(0xff973133)
                                  : */
                                  Colors.transparent,
                            ),
                            child: Text(LanguageConstants.e5Textsuv.tr,
                                style: AppTextStyle.textStyleUtils500()),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(color: const Color(0xff367587))),
                            child: Text(
                              LanguageConstants.e10Textsuv.tr,
                              style: AppTextStyle.textStyleUtils500(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: const Color(0xff367587)),
                            ),
                            child: Text(
                              LanguageConstants.e15Textsuv.tr,
                              style: AppTextStyle.textStyleUtils500(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: const Color(0xff367587)),
                            ),
                            child: Text(LanguageConstants.e20Textsuv.tr,
                                style: AppTextStyle.textStyleUtils500()),
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border:
                                  Border.all(color: const Color(0xff367587)),
                            ),
                            child: Text(
                              LanguageConstants.e25Textsuv.tr,
                              style: AppTextStyle.textStyleUtils500(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 60,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8.0,
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
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], // Only numbers can be entered
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 0, top: 16, left: 10),
                                    hintText: "",
                                    labelStyle: AppTextStyle.textStyleUtils400(
                                        color: Colors.black54),
                                    errorStyle:
                                        AppTextStyle.textStyleUtils400(),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(0.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "${LanguageConstants.theSelectamountText.tr}\n${LanguageConstants.shippingCartText.tr}",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                    const SizedBox(height: 14.0),
                    Text(LanguageConstants.iwanttoDonateText.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils500()
                            .copyWith(decoration: TextDecoration.underline)),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget priceWidget(int value) {
    return Container(
      height: 27,
      width: 52,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: appColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('£ $value',
          style: AppTextStyle.textStyleUtils400(color: appColor)),
    );
  }

  Widget amountTextField() {
    return Container(
      height: 42.5,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: appColor, width: 1.25),
      ),
      child: Row(
        children: [
          Container(
            height: 42.5,
            width: 60,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: appColor, width: 1.25),
            ),
            alignment: Alignment.center,
            child: Text(LanguageConstants.gbpText.tr,
                style: AppTextStyle.textStyleUtils400(
                    color: Colors.white, size: 13.5)),
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintStyle: AppTextStyle.textStyleUtils400(
                    color: Colors.black54, size: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget donateButton() {
    return SizedBox(
      width: 250,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstants.iwanttoDonateText.tr.toUpperCase(),
          style:
              AppTextStyle.textStyleUtils600(color: Colors.white, size: 12.8),
        ),
      ),
    );
  }

  Widget dialogContent(
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                //color: Color(0xffd1f2ff),

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
                    Text(LanguageConstants.testDonationText.tr.toUpperCase()),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  //color: blackColor,
                  padding: const EdgeInsets.all(14),
                  child: Text(LanguageConstants.youAddedTestText.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400()),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff367587)),
                            color: whiteColor),
                        child: Text(LanguageConstants.e5Text.tr,
                            style: AppTextStyle.textStyleUtils500()),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(color: const Color(0xff367587))),
                        child: Text(LanguageConstants.e10Text.tr,
                            style: AppTextStyle.textStyleUtils500()),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 15.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 15
                              ? Color(0xff973133)
                              : */
                              whiteColor,
                          border: Border.all(color: const Color(0xff367587)),
                        ),
                        child: Text(
                          LanguageConstants.e15Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xff367587)),
                        ),
                        child: Text(
                          LanguageConstants.e20Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: const Color(0xff367587)),
                        ),
                        child: Text(
                          LanguageConstants.e25Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Text(
                  LanguageConstants.chooseYourOwmText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        color: offWhite,
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
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            //controller: null,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: offWhite,
                                contentPadding: const EdgeInsets.only(
                                    bottom: 0, top: 16, left: 10),
                                hintText: "",
                                labelStyle: AppTextStyle.textStyleUtils400(
                                    color: Colors.black54),
                                errorStyle: AppTextStyle.textStyleUtils400(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(LanguageConstants.theSelectedAmountText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400()),
                const SizedBox(height: 14.0),
                Text(LanguageConstants.iwantToDonateText.tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils500(
                            color: const Color(0xff367587))
                        .copyWith(decoration: TextDecoration.underline)),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
