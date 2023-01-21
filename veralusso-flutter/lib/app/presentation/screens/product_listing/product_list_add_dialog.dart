import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/product/product_model.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:veralusso/app/controller/cart/cart_controller.dart';
import 'package:veralusso/app/controller/product_listing/product_controller.dart';
import 'package:veralusso/app/core/const/app_constants.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/presentation/common_widget/screen_loading.dart';
import 'package:veralusso/app/presentation/screens/product_listing/product_list_screen.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class ProductListAddDialog extends StatelessWidget {
  ProductListAddDialog({Key? key, required this.item}) : super(key: key);
  final ProductItem item;

  final ProductController productController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      elevation: 6.0,
      radius: 0,
      contentPadding: const EdgeInsets.all(14.0),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      backgroundColor: whiteColor,
      contentWidget: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 22,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${item.name}".toTitleCase(),
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              border: Border.all(color: blackColor),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  "${AppConstants.productImageUrl}${item.getProductImage()}",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Visibility(
                            visible: item.typeId == 'configurable',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 200,
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: blackColor),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<SizeModel>(
                                      items: productController.listOfChoose
                                          .map(
                                            (value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(value.label.toString()),
                                            ),
                                          )
                                          .toList(),
                                      isExpanded: true,
                                      hint: productController.sizeList.isEmpty
                                          ? Text(
                                              '${LanguageConstants.specialSizeSelectSizeText.tr}...',
                                            )
                                          : Text(
                                              "${productController.sizeList.first.label}",
                                              style: AppTextStyle.textStyleUtils400(),
                                            ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 22,
                                        color: Colors.black,
                                      ),
                                      iconEnabledColor: Colors.transparent,
                                      onChanged: (valueList) {
                                        debugPrint("Val $valueList");
                                        productController.sizeList.clear();
                                        productController.sizeList.add(valueList!);
                                        if (productController.sizeList.first.value == "Missing") {
                                          return;
                                          // productController.showDialogBoxOpen(context,true,item);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      imageDialog(
                                        LanguageConstants.sizeChartText.tr,
                                        item.getSizeChart(),
                                        context,
                                      );
                                    },
                                    child: Text(
                                      LanguageConstants.sizeChartText.tr,
                                      style: AppTextStyle.textStyleUtils400().copyWith(
                                        decorationThickness: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                productController.dropdownValidator.value
                                    ? Text(
                                        LanguageConstants.selectSizeFirst.tr,
                                        style: AppTextStyle.textStyleUtils400(
                                          color: Colors.red,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          cartController.checkItemSkuEmptyData(item)
                              ? InkWell(
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20), border: Border.all(color: blackColor)),
                                    child: Text(
                                      LanguageConstants.addTOCart.tr,
                                      style: AppTextStyle.textStyleUtils500(),
                                    ),
                                  ),
                                  onTap: () async {
                                    await productController.addToCartPopUPTap(item, cartController);
                                  },
                                )
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: blackColor)),
                                        child: Text(
                                          LanguageConstants.buyNow.tr,
                                          style: AppTextStyle.textStyleUtils500(),
                                        ),
                                      ),
                                      onTap: () async {
                                        Get.toNamed(RoutesConstants.checkoutOrderScreen,
                                            arguments: cartController.cartModel.value);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 35,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: blackColor)),
                                        child: Text(
                                          LanguageConstants.viewCartText.tr,
                                          style: AppTextStyle.textStyleUtils500(),
                                        ),
                                      ),
                                      onTap: () async {
                                        Get.back();
                                        Get.toNamed(RoutesConstants.cartScreen);
                                      },
                                    ),
                                  ],
                                ),
                          InkWell(
                            child: Container(
                              height: 35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20), border: Border.all(color: blackColor)),
                              child: Text(
                                LanguageConstants.continueShoppingText.tr,
                                style: AppTextStyle.textStyleUtils500(),
                              ),
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      Text(
                        LanguageConstants.recommendation.tr,
                        style: AppTextStyle.textStyleUtils400(size: 15),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: productController.recommendationList.isEmpty ? 20 : 185,
                        child: productController.recommendationList.isEmpty
                            ? Container()
                            : productController.recommendationList[0].imageUrl == null
                                ? Center(
                                    child: Text(productController.recommendationList[0].message.toString()),
                                  )
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productController.recommendationList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () async {
                                          await productController.recommendationTap(
                                            index,
                                            cartController,
                                          );
                                        },
                                        child: SizedBox(
                                          width: 120,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 100,
                                                margin: const EdgeInsets.only(
                                                  right: 5,
                                                  left: 5,
                                                  top: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: backGroundColor,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: blackColor.withOpacity(0.30),
                                                      blurRadius: 8,
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                    color: blackColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Image(
                                                      width: 162,
                                                      image: NetworkImage(
                                                        productController.recommendationList[index].imageUrl.toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                productController.recommendationList[index].name
                                                    .toString()
                                                    .toTitleCase(),
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle.textStyleUtils400(size: 11.0),
                                              ),
                                              Text(
                                                productController.recommendationList[index].price.toString(),
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.textStyleUtils400(size: 11.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ],
                  ),
                ),
                productController.dialogLoader.value ? const ScreenLoading() : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void imageDialog(String text, path, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CommonAlertDialog(
          insetPadding: const EdgeInsets.all(20),
          contentWidget: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$text',
                      style: AppTextStyle.textStyleUtils500_16(),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 16,
                      ),
                      color: blackColor,
                    ),
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl: '$path',
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}
