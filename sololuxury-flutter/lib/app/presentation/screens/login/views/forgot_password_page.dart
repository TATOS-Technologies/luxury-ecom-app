import 'package:solo_luxury/all_imports.dart';

import '../../../../core/const/app_style.dart';
import '../widget/forgot_password_email_textfield.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordPageController> {
  final int click = 0;
  final bool visible = false;
  final TextEditingController emailcontroller = TextEditingController();

  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaQueryW = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: homeBackground,
        body: Form(
          key: controller.formKey.value,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 8.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAsset.menuSolo)
                            // SizedBox(width: 12.0),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Image.asset(
                                AppAsset.solo1,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Image.asset(AppAsset.magnifying),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Image.asset(
                                AppAsset.like2,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  AppAsset.shoppingbag2,
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                Positioned(
                                    top: 6,
                                    right: -1,
                                    child: Text(
                                      "0",
                                      style:
                                          AppStyle.textStyleUtils400(size: 8),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 60.0, bottom: 16.0),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 3.0,
                              child: Container(
                                width: mediaQueryW * 0.6,
                                height: 0.5,
                                color: const Color(0xff973133),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: mediaQueryW * 0.7,
                    child: Text(
                      LanguageConstants.pleaseEnterYourEmailAddressText.tr,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.textStyleUtils400_16(),
                    ),
                  ),
                  Container(
                      height: 40,
                      width: mediaQueryW * 0.9,
                      margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.8),
                      ),
                      child: const ForgotPasswordEmailTextField()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0.0,
                        backgroundColor: const Color(0xFF8A3A06),
                      ),
                      child: Text(
                        LanguageConstants.resetMyPasswordText.tr,
                        style: AppStyle.textStyleUtils600_14(
                            color: const Color(0xffF9EAE3)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_outlined,
                        size: 16, color: Color(0xff973133)),
                    label: Text(LanguageConstants.backToLogin.tr,
                        style: AppStyle.textStyleUtils400_16(
                          color: const Color(0xFF8A3A06),
                        )),
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
