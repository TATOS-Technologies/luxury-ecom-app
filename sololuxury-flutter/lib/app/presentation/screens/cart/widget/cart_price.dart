import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';

import '../../../../core/const/app_style.dart';

class CartPrice extends GetView<CartController> {
  final int index;

  const CartPrice(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Text(
        localStore.getPriceWithSymbol(
          ((controller.cartModel.value.items?[index].qty ?? 0) *
                  (double.tryParse(controller
                              .cartModel.value.items?[index].price
                              .toString() ??
                          '') ??
                      0))
              .toString(),
        ),
        style: AppStyle.textStyleUtils500(size: 16.sp),
      ),
    );
  }
}
