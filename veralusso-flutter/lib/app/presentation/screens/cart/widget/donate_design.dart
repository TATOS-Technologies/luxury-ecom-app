import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'dialog_content.dart';

class DonateDesign extends StatelessWidget {
  const DonateDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 12),
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: Get.width,
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConstants.cartContain1.tr,
            style: AppTextStyle.textStyleUtils600_16(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.cartContain2.tr,
            style: AppTextStyle.textStyleUtils300(),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(AppAsset.he),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConstants.cartContain3.tr,
                      style: AppTextStyle.textStyleUtils600(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MaterialButton(
                      onPressed: () {
                        _showDialog(context);
                      },
                      elevation: 0,
                      minWidth: 175,
                      color: blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        LanguageConstants.cartContain4.tr,
                        style:
                            AppTextStyle.textStyleUtils600(color: whiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: const DialogContent(),
        );
      },
    );
  }
}
