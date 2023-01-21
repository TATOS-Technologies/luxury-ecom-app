import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/product_add_to_cart_controller.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductAddToCartScreen extends GetView<ProductAddToCartController> {
  const ProductAddToCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductAddToCartController());

    return Scaffold(
      key: controller.scaffoldKey.value,
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
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
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
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
              child: SvgPicture.asset(
                AppAsset.cart,
                color: Colors.black,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
              child: Text(
                LanguageConstants.gdpText.tr.toUpperCase(),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 4.0),
              child: Text("| ${LanguageConstants.engText.tr.toUpperCase()} |")),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20, right: 8.0),
            child: Image.asset(
              AppAsset.indianFlag,
              height: 20,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                controller.showDialogBox(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 46,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(10.0),
                      color: const Color(0xff000080),
                      alignment: Alignment.center,
                      child: Text(
                        LanguageConstants.addToCart.tr,
                        style: AppTextStyle.textStyleUtils500_16(
                            color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.aboutBrandsTxxt.tr.toUpperCase(),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.add),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.helpAndInfoText.tr.toUpperCase(),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.add),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.morefromBrandsText.tr.toUpperCase(),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.add),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageConstants.newsletterText.tr.toUpperCase(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: null,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                bottom: 12, top: 12, left: 10),
                            hintText: LanguageConstants.emailAddress.tr,
                            labelStyle: AppTextStyle.textStyleUtils400(color: Colors.black54),
                            errorStyle: AppTextStyle.textStyleUtils400(),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: const BorderSide(
                                color: Color(0xff000080),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: const BorderSide(
                                color: Color(0xff000080),
                                width: 1.0,
                              ),
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff000080),
                                ),
                                borderRadius: BorderRadius.circular(0.0))),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: MediaQuery.of(context).size.height / 15.6,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color(0xff000080),
                          )),
                      alignment: Alignment.center,
                      child: Text(
                        LanguageConstants.subscribe.tr.toUpperCase(),
                        style: AppTextStyle.textStyleUtils400(
                          color: const Color(0xff000080),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ))
        ],
      ),
    );
  }
}
