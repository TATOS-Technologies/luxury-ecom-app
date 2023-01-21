import 'dart:ui';

import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/screens/wishlist/widget/wishlist_list_item.dart';

class MyWishListPage extends GetView<WishlistController> {
  final Function? backToShop;

  const MyWishListPage({Key? key, this.backToShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldkey,
      appBar: commonAppbar(title: LanguageConstants.myWishlistText.tr),
      backgroundColor: homeBackground,
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: AbsorbPointer(
                  absorbing: true,
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: const SpinKitThreeBounce(
                        color: appColor,
                      ),
                    ),
                  ),
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  controller.onInit();
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    WishlistListItem(backToShop: backToShop),
                    controller.isScreenLoading.value
                        ? const Center(
                            child: SpinKitThreeBounce(
                              color: appColor,
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ),
      ),
    );
  }
}
