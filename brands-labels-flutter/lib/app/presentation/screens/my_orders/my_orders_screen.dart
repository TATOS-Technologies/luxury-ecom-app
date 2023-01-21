import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/my_orders_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_animations/nothing_to_show_animation.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_orders/my_orders_data.dart';
import '../../../core/utils/app_routes.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      appBar: commonAppbar(title: LanguageConstants.myOrdersText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appBarPrimary,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: controller.isOrderIsEmpty()
                    ? emptyDataWidget()
                    : ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          ParentItemElement? item = controller.myOrdersModel?.value.items?[index].items?.first;
                          MyOrdersDataItem? orderData = controller.myOrdersModel?.value.items?[index];
                          return myOrderWidget(item, orderData);
                        },
                        itemCount: controller.myOrdersModel?.value.items?.length ?? 0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 10);
                        },
                      ),
              ),
      ),
    );
  }

  Widget myOrderWidget(ParentItemElement? item, MyOrdersDataItem? orderData) {
    if (item == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesConstants.orderDetailScreen, arguments: [item, orderData]);
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 1)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.myOrderImage.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Container(
                  height: 90,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: darkBlue,
                      width: 1.4,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.extensionAttributess?.productImage ?? '',
                    fit: BoxFit.fill,
                    height: 90,
                    width: 90,
                    memCacheHeight: 150,
                    memCacheWidth: 200,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.productName.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Text(
                    item.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.sku.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Text(
                  item.sku ?? '',
                  style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.price.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Text(
                  item.price?.toString() ?? '',
                  style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.quantity.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Text(
                  item.qtyOrdered.toString(),
                  style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.status.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Text(
                  orderData?.status.toString() ?? '',
                  style: AppTextStyle.textStyleUtils400(color: Colors.black54),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstants.action.tr,
                  style: AppTextStyle.textStyleUtils500(),
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget emptyDataWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NothigToShowAnimationWidget(),
          Text( 
            LanguageConstants.youHaveNoOrders.tr,
            style: AppTextStyle.normalRegular14,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 35.w,
            width: 250.w,
            child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(RoutesConstants.dashboardScreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 1,
                backgroundColor: appBarPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: CommonTextOpenSans(
                LanguageConstants.continueShopping.tr,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
