import 'package:avoirchic/app/controller/wishlist_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/size/size_model.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:meta_package/translations/translations.dart';

import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';
class WishlistDataItem extends GetView<WishlistController> {
  const WishlistDataItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio:
        MediaQuery.of(Get.context!).size.aspectRatio * 3 / 3.4,
      ),
      itemBuilder: (_, index) {
        ItemProduct? item = controller.wishItemModel?.value.items?[index];
        return GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: appBorderColor,
                    width: 6,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: controller.productImage(index),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  memCacheWidth: 200,
                  memCacheHeight: 150,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(item?.product?.name ?? '',
                  maxLines: 2,
                  style: const TextStyle(overflow: TextOverflow.ellipsis)),
              const SizedBox(
                height: 2,
              ),
              Text(
                controller.getProductPrice(index),
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleUtils400_16(),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      controller.getGenerateCart(index);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: appTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: CommonTextOpenSans(
                      LanguageConstants.addTOCart.tr,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.5,
                    ),
                  ),
                  Container(
                    height: 31,
                    width: 31,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: item?.product?.countController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      style: AppTextStyle.textStyleUtils400(),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 5, right: 5, bottom: 12)),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4), // for mobile
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.deleteWishListData(index);
                    },
                    child: Image(
                      image: AssetImage(AppAsset.deleteIcon),
                      color: blackColor,
                      height: 18,
                    ),
                  ),
                ],
              ),
              Obx(
                    () => Visibility(
                  visible: controller
                      .wishItemModel?.value.items?[index].product?.typeId ==
                      'configurable',
                  child: Container(
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: backGroundColor,
                      border: Border.all(color: avoirChickLightBgTheme),
                    ),
                    child: item?.product?.sizeList?.isNotEmpty == true
                        ? DropdownButtonHideUnderline(
                      child: DropdownButton<SizeModel>(
                        items: item?.product?.sizeList!
                            .map(
                              (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value.label.toString()),
                          ),
                        )
                            .toList(),
                        isExpanded: true,
                        hint: Text(
                          LanguageConstants.chooseAnOption.tr,
                          style: const TextStyle(fontSize: 12),
                        ),
                        value:
                        item?.product?.selectSizeValue?.value.value !=
                            null
                            ? item?.product?.selectSizeValue?.value
                            : null,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.black,
                        ),
                        iconEnabledColor: Colors.transparent,
                        onChanged: (valueList) {
                          item?.product?.selectSizeValue?.value =
                              valueList ?? SizeModel();
                        },
                      ),
                    )
                        : const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: controller.wishItemModel?.value.items?.length ?? 0,
    );
  }

}