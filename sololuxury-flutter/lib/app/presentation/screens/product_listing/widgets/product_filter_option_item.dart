// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import '../../../../../all_imports.dart';

class ProductFilterOptionItem extends GetView<ProductController> {
  List<Category>? childCategory2;
  String? attrCode;
  FilterModel filter;

  ProductFilterOptionItem({
    Key? key,
    this.childCategory2,
    this.attrCode,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (childCategory2 != null) {
      child = (attrCode != 'brands' && attrCode != 'cat' && attrCode != 'price')
          ? GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 5,
              children: List.generate(childCategory2?.length ?? 0, (i) {
                return InkWell(
                  onTap: () {
                    controller.selectedCategory.value = filter;
                    controller.checkUncheckOptions(childCategory2, i);
                    debugPrint(controller.selectedMap.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Obx(
                          () => Container(
                            height: 24.0,
                            width: 24.0,
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              childCategory2![i].isSelected.value
                                  ? Icons.check_box_sharp
                                  : Icons.check_box_outline_blank_sharp,
                              color: appColor,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '${childCategory2![i].display}  (${childCategory2![i].count})',
                            style: const TextStyle(color: appColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }))
          : attrCode == 'price'
              ? GetBuilder<ProductController>(builder: (controller) {
                  return Column(
                    children: [
                      RangeSlider(
                        inactiveColor: grey.withOpacity(.6),
                        activeColor: appColor,
                        values: controller.currentRangeValues,
                        min: filter.minPrice,
                        max: filter.maxPrice,
                        // divisions: 10,
                        labels: RangeLabels(
                          controller.currentRangeValues.start.round().toString(),
                          controller.currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          controller.currentRangeValues = values;
                          controller.update();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(controller.getPriceRangeWithCurrencyForFilter()),
                      )
                    ],
                  );
                })
              : attrCode == 'brands'
                  ? GetBuilder<ProductController>(builder: (controller) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                              child: CommonTextFieldOpenSans(
                                hintText: LanguageConstants.searchText.tr,
                                controller: controller.searchEditingController,
                                textFieldBorder: Border.all(color: Colors.black),
                                textColor: appTextFieldHintColor,
                                fontWeight: FontWeight.w600,
                                onChanged: (val) {
                                  debugPrint("onChanged -> $val");
                                  controller.data = [];
                                  controller.data = controller.searchFilter(val, childCategory2);
                                  childCategory2 = controller.data;
                                },
                              ),
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                // physics:const NeverScrollableScrollPhysics(),
                                itemCount: controller.isSearch
                                    ? controller.data?.length ?? 0
                                    : childCategory2?.length ?? 0,
                                itemBuilder: (BuildContext context, int i) {
                                  return InkWell(
                                    onTap: () {
                                      if (controller.isSearch) {
                                        controller.selectedCategory.value = filter;
                                        controller.checkUncheckOptions(controller.data, i);
                                      } else {
                                        controller.selectedCategory.value = filter;
                                        controller.checkUncheckOptions(childCategory2, i);
                                      }
                                    },
                                    child: controller.isSearch
                                        ? Container(
                                            margin: const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                Obx(
                                                  () => Container(
                                                    height: 24.0,
                                                    width: 24.0,
                                                    alignment: Alignment.centerLeft,
                                                    child: Icon(
                                                      controller.data![i].isSelected.value
                                                          ? Icons.check_box_sharp
                                                          : Icons.check_box_outline_blank_sharp,
                                                      color: appColor,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 5, bottom: 5),
                                                  child: Text(
                                                      '${controller.data![i].display}  (${controller.data![i].count})',
                                                      style: const TextStyle(color: appColor)),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            margin: const EdgeInsets.only(left: 10),
                                            // height: 10,
                                            // width: 50,
                                            // color: Colors.yellow,
                                            child: Row(
                                              children: [
                                                Obx(
                                                  () => Container(
                                                    height: 24.0,
                                                    width: 24.0,
                                                    alignment: Alignment.centerLeft,
                                                    child: Icon(
                                                      childCategory2![i].isSelected.value
                                                          ? Icons.check_box_sharp
                                                          : Icons.check_box_outline_blank_sharp,
                                                      color: appColor,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 5, bottom: 5),
                                                  child: Text(
                                                      '${childCategory2![i].display}  (${childCategory2![i].count})',
                                                      style: const TextStyle(color: appColor)),
                                                ),
                                              ],
                                            ),
                                          ),
                                  );
                                }),
                          ],
                        ),
                      );
                    })
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              // physics:const NeverScrollableScrollPhysics(),
                              itemCount: childCategory2?.length,
                              itemBuilder: (BuildContext context, int i) {
                                return InkWell(
                                  onTap: () {
                                    controller.selectedCategory.value = filter;
                                    controller.checkUncheckOptions(childCategory2, i);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    // height: 10,
                                    // width: 50,
                                    // color: Colors.yellow,
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Container(
                                            height: 24.0,
                                            width: 24.0,
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              childCategory2![i].isSelected.value
                                                  ? Icons.check_box_sharp
                                                  : Icons.check_box_outline_blank_sharp,
                                              color: appColor,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5, bottom: 5),
                                          child: Text(
                                              '${childCategory2![i].display}  (${childCategory2![i].count})',
                                              style: const TextStyle(color: appColor)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
    } else {
      child = const Text("Nothing to show");
    }

    return Container(child: child);
  }
}
