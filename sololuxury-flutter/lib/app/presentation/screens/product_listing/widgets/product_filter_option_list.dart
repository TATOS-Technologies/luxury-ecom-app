import '../../../../../all_imports.dart';
import 'product_filter_option_item.dart';

class ProductFilterOptionList extends GetView<ProductController> {
  const ProductFilterOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterModelList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                color: appColorButton2,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: appTileBorderColor, width: 2)),
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: ExpansionTile(
                onExpansionChanged: (bool selected) {
                  controller.filterModelList?[index].isSelected = selected;
                  controller.update();
                },
                trailing: GetBuilder<ProductController>(builder: (controller) {
                  return (controller.filterModelList?[index].isSelected ??
                          false)
                      ? const Icon(
                          Icons.remove,
                          color: appColor,
                        )
                      : const Icon(Icons.add, color: appColor);
                }),
                title: CommonTextOpenSans(
                  "${controller.filterModelList?[index].attrLabel}",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: appColor,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ProductFilterOptionItem(
                        childCategory2:
                            controller.filterModelList?[index].category,
                        attrCode: controller.filterModelList?[index].attrCode,
                        filter: controller.filterModelList?[index] ??
                            FilterModel()),
                  )
                ]),
          );
        });
  }
}
