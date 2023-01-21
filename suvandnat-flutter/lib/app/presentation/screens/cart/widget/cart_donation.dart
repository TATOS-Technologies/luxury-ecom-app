import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/cart/donation_modal.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/controller/cart/cart_controller.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class CartDonation extends GetView<CartController> {
  const CartDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LanguageConstants.cartContain1.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(color: primary, size: 14.sp),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstants.cartContain2.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils300(),
          ),
          const SizedBox(
            height: 28,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.donationList.length,
            separatorBuilder: (
              BuildContext context,
              int index,
            ) =>
                const Divider(
              color: whiteColor,
            ),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return donationItem(
                context,
                controller.donationList[index],
              );
            },
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
        bottom: 12,
      ),
      width: Get.width,
      decoration: BoxDecoration(
          color: greenD1F1FF, borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget donationItem(
    BuildContext context,
    DonationItems itemData,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemData.imageURL == "" && itemData.imageURL == null
            ? Image(
                image: AssetImage(
                  AppAsset.he,
                ),
              )
            : Image.network(
                itemData.imageURL!,
                height: 60,
                fit: BoxFit.cover,
              ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LanguageConstants.cartContain3.tr,
                style: AppTextStyle.textStyleUtils400_12(),
              ),
              const SizedBox(
                height: 5,
              ),
              CommonThemeButton(
                onTap: () async {
                  _showDialog(context);
                },
                title: LanguageConstants.cartContain4.tr,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }

  void _showDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              0.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: dialogContent(
            context,
          ),
        );
      },
    );
  }

  Widget dialogContent(
    BuildContext context,
  ) {
    //final controller = Get.put(CartController());
    return Container(
      margin: const EdgeInsets.only(
        left: 0.0,
        right: 0.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
            margin: const EdgeInsets.only(
              top: 13.0,
              right: 8.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffd1f2ff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(
                0.0,
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LanguageConstants.testDonationText.tr.toUpperCase(),
                      style: AppTextStyle.textStyleUtilsUnderLine16(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  color: const Color(
                    0xff63AAC9,
                  ),
                  padding: const EdgeInsets.all(
                    14,
                  ),
                  child: Text(
                    LanguageConstants.youAddedTestText.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleUtils400(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 5.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(
                              0xff973133,
                            ),
                          ),
                          color: /*controller.selectedAmount.value == 5
                                ? Color(0xff973133)
                                : */
                              Colors.transparent,
                        ),
                        child: Text(
                          LanguageConstants.e5Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 10.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 10
                                ? Color(0xff973133)
                                : */
                              Colors.transparent,
                          border: Border.all(
                            color: const Color(
                              0xff973133,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e10Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 15.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 15
                              ? Color(0xff973133)
                              : */
                              Colors.transparent,
                          border: Border.all(
                            color: const Color(
                              0xff973133,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e15Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount = 20.obs;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 20
                              ? Color(0xff973133)
                              : */
                              Colors.transparent,
                          border: Border.all(
                            color: const Color(
                              0xff973133,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e20Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    InkWell(
                      onTap: () {
                        //controller.selectedAmount.value = 25;
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: /*controller.selectedAmount.value == 25
                              ? Color(0xff973133)
                              : */
                              Colors.transparent,
                          border: Border.all(
                            color: const Color(
                              0xff973133,
                            ),
                          ),
                        ),
                        child: Text(
                          LanguageConstants.e25Text.tr,
                          style: AppTextStyle.textStyleUtils500(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  LanguageConstants.chooseYourOwmText.tr,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleUtils400(),
                ),
                const SizedBox(height: 12.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: TextFormField(
                    //controller: null,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ], // Only numbers can be entered
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.only(
                        bottom: 12,
                        top: 12,
                        left: 10,
                      ),
                      hintText: "",
                      labelStyle: AppTextStyle.textStyleUtils400(
                        color: Colors.black54,
                      ),
                      errorStyle: AppTextStyle.textStyleUtils400(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          0.0,
                        ),
                        borderSide: const BorderSide(
                          color: Color(
                            0xff973133,
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          0.0,
                        ),
                        borderSide: const BorderSide(
                          color: Color(
                            0xff973133,
                          ),
                          width: 1.0,
                        ),
                      ),
                      prefixIcon: SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              LanguageConstants.gbpText.tr,
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleUtils400(),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 26,
                              width: 2,
                              color: Colors.black26,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(
                            0xff973133,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          0.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  LanguageConstants.theSelectedAmountText.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Center(
                  child: CommonThemeButton(
                    title:  LanguageConstants.iwantToDonateText.tr,
                    onTap: () {
                      
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
