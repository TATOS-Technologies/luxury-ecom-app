
import '../../../../../all_imports.dart';
import '../../../../core/const/app_style.dart';

class AddToCartButton extends GetView<ProductDetailController> {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: appColorPrimary,
        ),
        onPressed: controller.productIsInStock()
            ? () async {
                await controller.addToCart();
              }
            : null,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: homeBackground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: appColorPrimary, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        label: Text(
              !controller.productIsInStock()
                  ? LanguageConstants.soldOut.tr
                  : LanguageConstants.addTOCart.tr,
                  overflow: TextOverflow.ellipsis,
              style: AppStyle.textStyleUtils600_14(color: appColorPrimary),
            ),
      ),
    );
  }
}
