import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnReasonScreen extends StatelessWidget {
  const ReturnReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAsset.brandsLabelsLogo),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LanguageConstants.returnRequestText.tr,
                style: AppTextStyle.textStyleUtilsUnderLine18(
                    color: const Color(0xff000080))),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                LanguageConstants.wehaveRecivedText.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400_12(
                    color: const Color(0xFF6B6B6B)),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              LanguageConstants.teamSoloLuxuryText.tr,
              style: AppTextStyle.textStyleUtils400_12(
                  color: const Color(0xFF6B6B6B)),
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: CommonTextOpenSans(
                LanguageConstants.continueShopping.tr,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
