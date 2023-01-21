import 'package:solo_luxury/all_imports.dart';

class CartNumber extends GetView<CartController> {
  final int index;

  const CartNumber(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Text("${controller.cartModel.value.items?[index].qty ?? ''}"));
  }
}
