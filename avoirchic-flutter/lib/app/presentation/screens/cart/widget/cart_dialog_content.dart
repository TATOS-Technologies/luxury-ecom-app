import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../controller/cart_controller.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class CartDialogContent extends GetView<CartController> {
  const CartDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(
              top: 13.0,
              right: 8.0,
            ),
            decoration: BoxDecoration(
                color: primary,
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
                        color: const Color(0xff367587),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  //color: blackColor,
                  padding: const EdgeInsets.all(14),
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
                        //controller.selectedAmount = 5.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff367587)),
                            color: /*controller.selectedAmount.value == 5
                                ? Color(0xff973133)
                                : */
                                whiteColor),
                        child: Text(
                          LanguageConstants.e5Text.tr,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 10.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 10
                                ? Color(0xff973133)
                                : */
                              whiteColor,
                          border: Border.all(
                            color: const Color(
                              0xff367587,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e10Text.tr,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
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
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 15
                              ? Color(0xff973133)
                              : */
                              whiteColor,
                          border: Border.all(
                            color: const Color(
                              0xff367587,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e15Text.tr,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 20.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 20
                              ? Color(0xff973133)
                              : */
                              whiteColor,
                          border: Border.all(
                            color: const Color(
                              0xff367587,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e20Text.tr,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount.value = 25;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 25
                              ? Color(0xff973133)
                              : */
                              whiteColor,
                          border: Border.all(color: const Color(0xff367587)),
                        ),
                        child: Text(
                          LanguageConstants.e25Text.tr,
                          style: AppTextStyle.textStyleUtils400(),
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
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
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
                          //margin: EdgeInsets.symmetric(horizontal: 30.0),
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
                                bottom: 0,
                                top: 16,
                                left: 10,
                              ),
                              hintText: "",
                              labelStyle: AppTextStyle.textStyleUtils400(
                                color: Colors.black54,
                              ),
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
                                borderRadius: BorderRadius.circular(
                                  0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
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
                Text(
                  LanguageConstants.iwantToDonateText.tr.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtilsUnderLine14(
                    color: const Color(0xff367587),
                    fontWeight: FontWeight.w400,
                  ),
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
