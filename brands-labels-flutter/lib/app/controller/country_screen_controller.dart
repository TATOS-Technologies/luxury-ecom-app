import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_asset.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryScreenController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  void showCountry(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: const Color(0xffDADADA),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 10.0),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${LanguageConstants.yourAppExpericanceText.tr}:',
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            AppAsset.indianflagIcon,
                            fit: BoxFit.cover,
                            height: 26,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          LanguageConstants.indiaText.tr,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 14.0),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConstants.englishIsAlsoText.tr,
                      style: const TextStyle(),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 14),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff000080), width: 1.2)),
                          child: Text(
                            LanguageConstants.noThanksText.tr,
                            style: const TextStyle(
                                color: Color(0xff000080),
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                        const SizedBox(width: 14),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color(0xff000080),
                              border: Border.all(
                                  color: const Color(0xff000080), width: 1.2)),
                          child: Text(
                            LanguageConstants.changeText.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                        const SizedBox(width: 14),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
