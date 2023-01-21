import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_asset.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GuestReturnsScreen extends StatefulWidget {
  const GuestReturnsScreen({Key? key}) : super(key: key);

  @override
  State<GuestReturnsScreen> createState() => _GuestReturnsScreenState();
}

class _GuestReturnsScreenState extends State<GuestReturnsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                  child: SvgPicture.asset(
                    AppAsset.menuIcon,
                    color: Colors.black26,
                    height: 10,
                  ),
                ),
              ),
              centerTitle: false,
              title: Text(
                LanguageConstants.appnameText.tr,
                style: AppTextStyle.textStyleUtils400(color: Colors.black38),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                    child: SvgPicture.asset(
                      AppAsset.search,
                      color: const Color(0xff367587).withOpacity(0.8),
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // controller.scaffoldKey.value.currentState?.openDrawer();
                  },
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Image.asset(
                        AppAsset.signInIcon,
                        height: 16,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // controller.scaffoldKey.value.currentState?.openDrawer();
                  },
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Image.asset(
                        AppAsset.myacountIcon,
                        height: 16,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    // controller.scaffoldKey.value.currentState?.openDrawer();
                  },
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, top: 20, bottom: 20),
                      child: Image.asset(
                        AppAsset.bagIcon,
                        height: 16,
                      )),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2.0),
                child: Container(
                    height: 1.0, width: double.infinity, color: Colors.black38),
              ),
            ),
            drawer: const Drawer(),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 8.0),
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
                              style: AppTextStyle.textStyleUtils500_16(
                                color: const Color(0xff367587),
                              ),
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
                            contentPadding: const EdgeInsets.only(
                                bottom: 10, top: 10, left: 100),
                            hintText: LanguageConstants.orderRefernceText.tr,
                            labelStyle: AppTextStyle.textStyleUtils400(
                                color: Colors.black26),
                            errorStyle: AppTextStyle.textStyleUtils400(
                                color: Colors.black26),
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
                            text: LanguageConstants.howDoIFindText.tr,
                            style: AppTextStyle.textStyleUtils400(),
                            children: <TextSpan>[
                              TextSpan(
                                  text: LanguageConstants.orderRefernceText.tr,
                                  style: AppTextStyle.textStyleUtils400()
                                      .copyWith(
                                          decoration: TextDecoration.underline))
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
                              backgroundColor: const Color(0xff367587),
                            ),
                            child: Text(
                                LanguageConstants.specialSizeSubmitText.tr),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: const Color(0xff367587),
                  ),
                  const SizedBox(height: 10),
                  Text(LanguageConstants.companyText.tr.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400_16(
                          color: const Color(0xff367587))),
                  const SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black26,
                  ),
                  const SizedBox(height: 8),
                  Text(LanguageConstants.contactMyAccountText.tr.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400_16(
                          color: const Color(0xff367587))),
                  const SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black26,
                  ),
                  const SizedBox(height: 8),
                  Text(LanguageConstants.othersText.tr.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400_16(
                          color: const Color(0xff367587))),
                  const SizedBox(height: 30),
                  Text(LanguageConstants.subsubcribeText.tr.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleUtils400_16(
                          color: const Color(0xff367587))),
                  const SizedBox(height: 30),
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
                                hintText: LanguageConstants
                                    .specialSizeEmailAddressText.tr
                                    .toUpperCase(),
                                labelStyle: AppTextStyle.textStyleUtils400(
                                    color: Colors.black54),
                                errorStyle: AppTextStyle.textStyleUtils400(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0))),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: MediaQuery.of(context).size.height / 15.6,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          color: const Color(0xff367587),
                          alignment: Alignment.center,
                          child: Text(
                            LanguageConstants.specialSizeSubscribeText.tr,
                            style: AppTextStyle.textStyleUtils400(
                                color: Colors.white),
                          ),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
