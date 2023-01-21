import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/news_lettter_controller.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../theme/colors.dart';

class AppbarWidget extends GetView<NewsLetterController> {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: const Size.fromHeight(50).height,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textDarkBlue,
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AppAsset.logo,
                height: 30,
                width: 120,
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(RoutesConstants.cartScreen);
                },
                child: SizedBox(
                  height: 25.0,
                  width: 24.0,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        AppAsset.cart,
                        height: 34.0,
                        width: 24.0,
                        color: textDarkBlue,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text("0",
                                  style: AppTextStyle.textStyleUtils600_12(
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
