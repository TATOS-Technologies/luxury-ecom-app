import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: const Size.fromHeight(34).height,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Center(
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ],
          ),
          Image.asset(
            AppAsset.logo,
            height: 30,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(RoutesConstants.checkoutOrderScreen);
                },
                child: SizedBox(
                  height: 14.0,
                  width: 16.0,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAsset.cart1,
                        height: 14.0,
                        width: 14.0,
                        color: Colors.black,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(left: 2),
                          height: 9.0,
                          width: 9.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child:  Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                "1",
                                style: AppTextStyle.textStyleUtils400(
                                    color: Colors.white,
                                    size: 8.0
                                ),
                              ),
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
