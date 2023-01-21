import '../../../../../all_imports.dart';

class ProductSubCategoryWidget extends GetView<ProductController> {
  const ProductSubCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
        alignment: Alignment.topLeft,
        child: const SubSubCategoryWidget(),
      ),
    );
  }
}

class SubSubCategoryWidget extends GetView<ProductController> {
  const SubSubCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 45.0,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: filterBorderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              Image.asset(
                AppAsset.search1,
                color: filterBorderColor,
                height: 18.0,
                width: 18.0,
              ),
              const SizedBox(
                width: 3.0,
              ),
              Expanded(
                child: CommonTextFieldOpenSans(
                  hintText: LanguageConstants.searchText.tr,
                  controller: controller.searchEditingController,
                  textFieldBorder: Border.all(color: Colors.transparent),
                  textColor: appTextFieldHintColor,
                  fontWeight: FontWeight.w600,
                  onChanged: (val) {
                    List<Category> category = [];
                    debugPrint("onChanged -> $val");
                    controller.searchFilter(val, category);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 5.0),
            children: [
              Obx(
                () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  // <- add
                  itemCount: controller.subCategoryList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category? category = controller.subCategoryList?[index];
                    return InkWell(
                      onTap: () {
                        category?.isSelected.value = !category.isSelected.value;
                        if (category?.isSelected.value ?? false) {
                          controller.selectedMap.containsKey(
                                  controller.selectedCategory.value.attrCode)
                              ? controller.selectedMap.update(
                                  controller.selectedCategory.value.attrCode!,
                                  (value) {
                                    List tempVal = value;
                                    // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                                    value.contains(category?.value)
                                        ? tempVal.remove(category?.value)
                                        : tempVal.add(category?.value);
                                    return tempVal;
                                  },
                                )
                              : controller.selectedMap.addAll(
                                  {
                                    controller.selectedCategory.value.attrCode!:
                                        [category?.value]
                                  },
                                );
                        } else {
                          controller.selectedMap.containsKey(
                                  controller.selectedCategory.value.attrCode)
                              ? controller.selectedMap.update(
                                  controller.selectedCategory.value.attrCode!,
                                  (value) {
                                    List tempVal = value;
                                    value.contains(category?.value)
                                        ? tempVal.remove(category?.value)
                                        : tempVal.add(category?.value);
                                    return tempVal;
                                  },
                                )
                              : controller.selectedMap.addAll(
                                  {
                                    controller.selectedCategory.value.attrCode!:
                                        [category?.value]
                                  },
                                );
                        }
                        debugPrint(controller.selectedMap.toString());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Container(
                                height: 24.0,
                                width: 24.0,
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  (category?.isSelected.value ?? false)
                                      ? Icons.check_box_sharp
                                      : Icons.check_box_outline_blank_sharp,
                                  color: appColor,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                              child: CommonTextOpenSans(
                                category?.display,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
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
      ],
    );
  }
}
