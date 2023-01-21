import 'package:solo_luxury/all_imports.dart';

class AppSecureShoppingScreen extends StatelessWidget {
  const AppSecureShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: commonAppbar(title: LanguageConstants.secureShoppingText.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 39),
              Text(LanguageConstants.shopWithoutWorry.tr,
                  style: AppTextStyle.textStyleUtils400(size: 20).copyWith(
                      decorationColor: appColor,
                      decorationThickness: 1.5,
                      decoration: TextDecoration.underline)),
              const SizedBox(height: 22),
              Container(
                width: Get.width,
                height: 199,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAsset.appSecure), fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                LanguageConstants.fillYourCartText.tr,
                textAlign: TextAlign.justify,
                style: AppTextStyle.textStyleUtils400(size: 16),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.weAimToSatisfyText.tr,
                textAlign: TextAlign.justify,
                style: AppTextStyle.textStyleUtils400(size: 16),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.ifYouPayWithPayPal.tr,
                textAlign: TextAlign.justify,
                style: AppTextStyle.textStyleUtils400(size: 16),
              ),
              const SizedBox(height: 20),
              Text(
                LanguageConstants.inAdditionAllOtherPaymentsAreProcessed.tr,
                textAlign: TextAlign.justify,
                style: AppTextStyle.textStyleUtils400(size: 16),
              ),
              const SizedBox(height: 91),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(AppAsset.payPal),
                  ),
                  Image(
                    image: AssetImage(AppAsset.moneyBank),
                  ),
                  Image(
                    image: AssetImage(AppAsset.googleStore),
                  ),
                ],
              ),
              const SizedBox(height: 91),
            ],
          ),
        ),
      ),
    );
  }
}
