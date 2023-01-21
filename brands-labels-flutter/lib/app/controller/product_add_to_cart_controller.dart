import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAddToCartController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CommonAlertDialog(
          elevation: 6.0,
          radius: 0,
          contentPadding: const EdgeInsets.all(14.0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          contentWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.1,
                text: TextSpan(
                    text: LanguageConstants.youaddCartText.tr,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text: LanguageConstants.toShoopingCartText.tr,
                          style: const TextStyle(color: Colors.black, fontSize: 15)),
                    ]),
              ),
              const SizedBox(height: 4.0),
              RichText(
                textAlign: TextAlign.center,
                // textScaleFactor: 1.0,
                text: TextSpan(
                    text: LanguageConstants.totalText.tr,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: <TextSpan>[
                      const TextSpan(
                          text: ' 4 ', style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                          text: LanguageConstants.itemCartText.tr,
                          style: const TextStyle(color: Colors.black, fontSize: 15)),
                    ]),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80"))),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: const Color(0xff000080)),
                          child: Text(
                            LanguageConstants.continueShoppingText.tr,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: const Color(0xff000080)),
                                color: Colors.white),
                            child: Text(
                              LanguageConstants.gotoCartText.tr.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xff000080),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14.0),
            ],
          ),
        );
      },
    );
  }
}
