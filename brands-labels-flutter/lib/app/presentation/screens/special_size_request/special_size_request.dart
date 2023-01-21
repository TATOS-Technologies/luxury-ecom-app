import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/special_size_request_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SpecialSizeRequestScreen extends GetView<SpecialSizeRequestController> {
  const SpecialSizeRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SpecialSizeRequestController controller =
        Get.find<SpecialSizeRequestController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              AppAsset.brandsLabelsLogo,
            ),
          ),
          actions: [
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20, right: 10.0),
                child: SvgPicture.asset(
                  AppAsset.menuIcon,
                  color: Colors.black,
                  width: 18,
                )),
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                child: SvgPicture.asset(
                  AppAsset.search,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
              child: Image.asset(
                AppAsset.userIcon,
                height: 20,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
                child: SvgPicture.asset(
                  AppAsset.cart,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
              child: Text(
                LanguageConstants.gdpText.tr.toUpperCase(),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
                child:
                    Text("| ${LanguageConstants.engText.tr.toUpperCase()} |")),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
              child: Image.asset(
                AppAsset.indianFlag,
                height: 20,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                controller.showDialogBoxOpen(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 160,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Text(
                      LanguageConstants.showDialog.tr,
                      style: AppTextStyle.textStyleUtils400(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
