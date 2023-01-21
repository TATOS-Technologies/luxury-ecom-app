import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/guest_returns/guest_returns_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/presentation/screens/guest_returns/widgets/guest_returns.dart';
import 'package:veralusso/app/theme/app_asset.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class GuestReturnsScreen extends GetView<GuestReturnsController> {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      LanguageConstants.changetheworldwithyourpurchaseText.tr,
    ];
    final CarouselController controller = CarouselController();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: AppStyle.appBarSize,
          child: GuestReturnsAppBar(imgList, controller)),
      drawer: const Drawer(),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.checkYourOrderText.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils500_16(),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Text(
                  LanguageConstants.enterYourOrderText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding:
                        const EdgeInsets.only(bottom: 10, top: 10, left: 100),
                    hintText: LanguageConstants.orderRefernceText.tr,
                    labelStyle:
                        AppTextStyle.textStyleUtils400(color: Colors.black26),
                    errorStyle:
                        AppTextStyle.textStyleUtils400(color: Colors.black26),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    text: "${LanguageConstants.howDoIFindText.tr} ",
                    style: AppTextStyle.textStyleUtils400(),
                    children: <TextSpan>[
                      TextSpan(
                        text: LanguageConstants.orderRefernceText.tr,
                        style: AppTextStyle.textStyleUtilsUnderLine14(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // shape: StadiumBorder(),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(LanguageConstants.submitText.tr),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.companyText.tr.toUpperCase(),
                style: AppTextStyle.textStyleUtils700_18(),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black26,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.contactText.tr.toUpperCase(),
                style: AppTextStyle.textStyleUtils700_18(),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black26,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.othersText.tr.toUpperCase(),
                style: AppTextStyle.textStyleUtils700_18(),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.add,
                color: Colors.black,
                size: 26,
              ),
            ],
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.subsubcribeText.tr.toUpperCase(),
                style: AppTextStyle.textStyleUtils700_18(),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    LanguageConstants.getAllTheLatestText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils700_18(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
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
                      contentPadding:
                          const EdgeInsets.only(bottom: 12, top: 12, left: 10),
                      hintText: LanguageConstants.enterEmailAddress.tr,
                      labelStyle:
                          AppTextStyle.textStyleUtils400(color: Colors.black54),
                      errorStyle: AppTextStyle.textStyleUtils400(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height / 15.6,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    LanguageConstants.specialSizeSubscribeText.tr.toUpperCase(),
                    style: AppTextStyle.textStyleUtils400(color: Colors.white),
                  ),
                ))
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(height: 1.0, width: double.infinity, color: Colors.black),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAsset.facebookIcon,
                height: 26,
                color: Colors.black,
              ),
              const SizedBox(width: 14),
              Image.asset(
                AppAsset.twitterIcon,
                height: 26,
                color: Colors.black,
              ),
              const SizedBox(width: 14),
              Image.asset(
                AppAsset.linkedInIcon,
                height: 26,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
