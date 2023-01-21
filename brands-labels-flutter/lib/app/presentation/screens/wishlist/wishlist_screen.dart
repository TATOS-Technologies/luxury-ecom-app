import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/wishlist_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_theme_button.dart';
import 'package:brandslabels/app/presentation/screens/wishlist/widgets/wishlist_item.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import '../../../core/utils/app_routes.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';

class MyWishListPage extends GetView<WishlistController> {
  final Function? backToShop;

  const MyWishListPage({Key? key, this.backToShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.myWishlistText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? spinnerWidget()
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: wishListWidget(),
                  ),
                  controller.isScreenLoading.value
                      ? spinnerWidget()
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }

// <<<<<<< Updated upstream
  Widget textButtonCommon(
      {VoidCallback? onTap, IconData? icon, String? label}) {
    return TextButton(
      onPressed: onTap,
      child: SizedBox(
        //width: 104,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                icon == null
                    ? Image(
                        image: AssetImage(AppAsset.shoppingBasket),
                      )
                    : Icon(
                        icon,
                        color: darkBlue,
                      ),
                Text(
                  label ?? '',
                  style: AppTextStyle.textStyleUtils500(
                      color: darkBlue, size: 15.w),
                ),
              ],
            ),
            const Divider(
              color: darkBlue,
              thickness: 1,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget wishListWidget() {
    return controller.isWishListEmpty()
        ? emptyDataWidget()
        : wishLisDataWidget();
  }

  Widget dropdownWidget() {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: darkBlue),
          borderRadius: BorderRadius.circular(0)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: AlignmentDirectional.center,
          isExpanded: true,
          dropdownColor: whiteColor,
          value: controller.chosenValue.value,
          style: AppTextStyle.textStyleUtils500(color: darkBlue),
          items: <String>[
            LanguageConstants.myAccountText.tr,
            LanguageConstants.myOrders.tr,
            LanguageConstants.myWishlistText.tr,
            LanguageConstants.addressBookText.tr,
            LanguageConstants.accountInformationText.tr,
            LanguageConstants.myTicketsText.tr,
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              alignment: AlignmentDirectional.center,
              value: value,
              child: Text(value),
            );
          }).toList(),
          icon: const Icon(Icons.expand_more, color: darkBlue),
          hint: Center(
            child: Text(
              LanguageConstants.myWishlistText.tr,
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleUtils500(color: appColor),
            ),
          ),
          onChanged: (String? value) {
            controller.chosenValue.value = value!;
          },
        ),
      ),
    );
  }

  Widget wishListBottomOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textButtonCommon(
          onTap: () {},
          label: LanguageConstants.wishList.tr,
          icon: Icons.edit_outlined,
        ),
        textButtonCommon(
          onTap: () {},
          label: LanguageConstants.wishList.tr,
          icon: Icons.share_outlined,
        ),
        textButtonCommon(
          onTap: () {},
          label: LanguageConstants.addAll.tr,
        ),
      ],
    );
  }

  Widget emptyDataWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text(
            LanguageConstants.youHaveNoProductsInYourWishList.tr,
            style: AppTextStyle.normalRegular14,
          ),
          SizedBox(height: 30.h,),
        
          SizedBox(
            height: 35.w,
            width: 260.w,
            child: CommonThemeButton(
              onTap: () {
                if (backToShop != null) {
                  backToShop!("true");
                } else {
                  Get.offAndToNamed(RoutesConstants.dashboardScreen);
                }
              },
              title:
                LanguageConstants.continueShopping.tr,
                
            ),
          )
        ],
      ),
    );
  }

  Widget wishLisDataWidget() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 25,
        childAspectRatio: .66,
      ),
      itemBuilder: (_, index) {
        ItemProduct? item = controller.wishItemModel?.value.items?[index];
        return WishlistItemProduct(item: item, index: index);
      },
      itemCount: controller.wishItemModel?.value.items?.length,
    );
  }

  Widget spinnerWidget() {
    return const Center(
      child: SpinKitThreeBounce(
        color: appBarPrimary,
      ),
    );
  }
}
