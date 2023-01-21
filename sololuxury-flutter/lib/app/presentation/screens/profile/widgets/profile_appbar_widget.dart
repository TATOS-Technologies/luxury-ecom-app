import 'package:solo_luxury/all_imports.dart';

class ProfileAppbarWidget extends GetView<ProfileController> {
  const ProfileAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(Get.context!).viewPadding.top + 15.0),
      child: Column(
        children: [
          CommonTextOpenSans(
            LanguageConstants.myAccountText.tr,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: appColorPrimary,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 15.0,
          ),
          const CommonDivider(
            color: appColorPrimary,
          ),
        ],
      ),
    );
  }
}
