import 'package:solo_luxury/all_imports.dart';
import 'package:meta_package/api/models/wishlist/wishlist_model.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class WishlistItem extends StatelessWidget {
  final ItemProduct? item;

  const WishlistItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed<dynamic>(RoutesConstants.productDetailsScreen,
            arguments: [item]);
      },
      child: Column(
        children: [
          Container(
            height: 340,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: Image.network(
              "${AppConstants.productImageUrl}${item?.product?.customAttributes?.first.value}",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: Get.width,
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: backgroundticket,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.10),
                  blurRadius: 25,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "${item?.product?.name}",
                  style: AppStyle.textStyleUtils400_16(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$ ${item?.product?.price}",
                    style: AppStyle.textStyleUtils600_14(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LanguageConstants.qtyText.tr,
                          style: AppStyle.textStyleUtils400_16(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              color: appTextFieldHintColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "${item?.product?.status}",
                            style: AppStyle.textStyleUtils400_16(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          height: 30,
                          elevation: 0,
                          minWidth: 119,
                          color: addToCartColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            LanguageConstants.addTOCart.tr.toUpperCase(),
                            style:
                                AppStyle.textStyleUtils600(color: whiteColor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage(AppAsset.edit),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Image(
                          image: AssetImage(AppAsset.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
