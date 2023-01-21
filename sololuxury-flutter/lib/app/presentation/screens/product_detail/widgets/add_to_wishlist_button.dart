import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class AddToWishlistButton extends GetView<ProductDetailController> {
  const AddToWishlistButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
    
      child: ElevatedButton.icon(
          onPressed: () async {
            await controller.postAddToWishlistData(
              context,
              controller.product!,
            );
          },
          icon: const Icon(
            Icons.favorite_border,
            color: appColorPrimary,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: homeBackground,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: appColorPrimary, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          label: Text(
            LanguageConstants.addToWishlist.tr,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.textStyleUtils600_14(color: appColorPrimary),
          )),
    );
  }
}
