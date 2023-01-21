import 'package:solo_luxury/all_imports.dart';

import 'widgets/profile_appbar_widget.dart';
import 'widgets/profile_title_w_arrow.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSubscribeButtonColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const ProfileAppbarWidget(),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top + 90.0,
                left: 30.0,
                right: 25.0,
              ),
              child: Obx(
                () => Column(
                  children: [
                    ProfileTitleWithArrow(
                        title: LanguageConstants.myAccountText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.myOrdersText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.myWishlistText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.addressBookText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.accountInformationText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.storePaymentText.tr),
                    ProfileTitleWithArrow(
                        title: LanguageConstants.newsLetterText.tr),
                    ProfileTitleWithArrow(
                      title: controller.countryCurrency.value,
                      onTap: () {
                        Get.toNamed<dynamic>(RoutesConstants.countryScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
