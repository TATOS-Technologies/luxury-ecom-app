import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/colors.dart';

import '../../../theme/app_asset.dart';

class InternetError {
  static final _instance = InternetError.internal();
  factory InternetError() => _instance;
  InternetError.internal();

  static OverlayEntry? entry;

  void show(BuildContext context, page) => addOverlayEntry(context);
  void hide() => removeOverlay();

  bool get isShow => entry != null;

  void addOverlayEntry(BuildContext context) {
    if (entry != null) return;
    entry = OverlayEntry(builder: (BuildContext context) {
      return LayoutBuilder(builder: (_, BoxConstraints constraints) {
        return Material(
          color: whiteColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppAsset.loader,
                  height: 250,
                  width: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                 Text(
                  LanguageConstants.pleaseCheckYourInternetConnection.tr,
                  style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(50),
                  // ),
                  height: 50,
                  width: 200,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    onPressed: () {
                      removeOverlay();
                    },
                    child: Text(
                      LanguageConstants.okay.tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });

    addoverlay(entry!, context);
  }

  void addoverlay(OverlayEntry entry, BuildContext context) async {
    Overlay.of(context)?.insert(entry);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }
}
