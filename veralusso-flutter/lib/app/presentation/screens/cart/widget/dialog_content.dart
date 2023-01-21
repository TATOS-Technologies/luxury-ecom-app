import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
              bottom: 20,
            ),
            margin: const EdgeInsets.only(top: 15.0, right: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.textDonationText.tr,
                      style: AppTextStyle.textStyleUtilsUnderLine16(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blackColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                      child: Text(
                        LanguageConstants.e5Text.tr,
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: blackColor,
                        ),
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                      child: Text(
                        LanguageConstants.e10Text.tr,
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        LanguageConstants.e15Text.tr,
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        LanguageConstants.e20Text.tr,
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2)),
                      child: Text(
                        LanguageConstants.e25Text.tr,
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  LanguageConstants.chooseYourownText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 60,
                        color: blackColor,
                        alignment: Alignment.center,
                        child: Text(
                          LanguageConstants.gbpText.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: TextFormField(
                            cursorColor: blackColor,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ], // Only numbers can be entered
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.only(
                                  bottom: 10, top: 10, left: 10),
                              hintText: "",
                              labelStyle: AppTextStyle.textStyleUtils400(
                                  color: Colors.black54),
                              errorStyle: AppTextStyle.textStyleUtils400(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: const BorderSide(
                                  color: blackColor,
                                  width: 1.0,
                                ),
                              ),
                              suffixIcon: null,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: blackColor,
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
                  LanguageConstants.theSelectamountText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: blackColor,
                  ),
                  child: Text(
                    LanguageConstants.iwanttoDonateText.tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.0,
            top: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: blackColor,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
