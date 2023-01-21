import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class CountryPopUpScreen extends GetView<CountryPopUpScreenController> {
  const CountryPopUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryPopUpScreenController());

    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text(
              LanguageConstants.myAccountText.tr,
              style: AppStyle.textStyleUtils400(color: appColor),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Container(
                  height: 1.0, width: double.infinity, color: appColor),
            ),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.showCountry(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstants.myAccountText.tr.toUpperCase(),
                        style: AppStyle.textStyleUtils400(),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.myOrdersText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.myWidhListText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.addressBookText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.accountInfoText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.storePaymentText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguageConstants.newsletterSubText.tr.toUpperCase(),
                      style: AppStyle.textStyleUtils400(),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ));
  }
}
