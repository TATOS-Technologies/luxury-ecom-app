import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/screens/charity/widget/show_dialog.dart';

class CharityScreen extends GetView<CharityPopUpController> {
  const CharityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CharityPopUpController());

    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.value.currentState?.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(ImageConstant.menuIcon),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.searchIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.heartIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                      color: Colors.black),
                ),
              ),
            ],
            title: Image.asset(AppAsset.logo, width: 110),
          ),
          drawer: const Drawer(),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        addNewShowDialog(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            LanguageConstants.addNew.tr,
                            style: AppStyle.textStyleUtils500_16(
                                color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
