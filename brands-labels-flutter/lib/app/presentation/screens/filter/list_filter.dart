import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/check_box_list_tile_model.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:brandslabels/app/controller/filter_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/colors.dart';

class ListFilterPage extends GetView<FilterController> {
  const ListFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(LanguageConstants.appNameText.tr, style: AppTextStyle.textStyleUtils700(size: 18)),
        ),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: Color(0xff000080),
                // size: 50.0,
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(width: 1, color: brownColor)),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 400,
                            decoration: const BoxDecoration(color: Color(0xffF6F6F6)),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          LanguageConstants.filtersText.tr,
                                          style: AppTextStyle.textStyleUtils500(size: 20),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.close,
                                      size: 25.0,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                                const Divider(),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        category(),
                                        subCategory(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(color: borderBlue, border: Border.all(width: 1, color: borderBlue)),
                      width: Get.width * .6,
                      child: MaterialButton(
                        onPressed: () {
                          controller.getFilteredProducts();
                        },
                        child: Center(
                          child: Text(
                            LanguageConstants.applyFilterText.tr,
                            style: AppTextStyle.textStyleUtils400(color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget category() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            // border: Border.all(width: 1, color: Colors.black)
            ),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 10.0, right: 5.0, top: 12.0, bottom: 10.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.filterModelList?.length ?? 0,
          itemBuilder: (_, index) {
            controller.filterModel?.value = controller.filterModelList?[index] ?? FilterModel();
            if (controller.filterModel == null) {
              return Container();
            }
            return categoryWidget(controller.filterModel?.value ?? FilterModel(), index);
          },
        ),
      ),
    );
  }

  Widget categoryWidget(FilterModel item, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.changedData(index);
          controller.selectedCategory.value = item;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: controller.currentCategoryIndex.value == index ? const Color(0xffDEDEDE) : Colors.transparent),
          width: Get.width,
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                CommonTextOpenSans("${item.attrLabel}", fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget subCategory() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              // border: Border.all(width: 1, color: Colors.black)
              ),
          child: subCategoryWidget()),
    );
  }

  Widget subCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(border: Border.all(width: 1, color: const Color(0xffCBCBCB))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Image.asset(
                AppAsset.search1,
                color: const Color(0xff8D8D8D),
                height: 18.0,
                width: 18.0,
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: SizedBox(
                  height: 35.0,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: LanguageConstants.searchText.tr,
                        fillColor: Colors.white,
                        hintStyle: AppTextStyle.textStyleUtils400(color: const Color(0xffCBCBCB), size: 13),
                        border: InputBorder.none
                        //fillColor: Colors.green
                        ),
                    style: AppTextStyle.textStyleUtils400(size: 13),
                    onChanged: (value) {
                      controller.searchFilter(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
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
                    controller.selectedMap.containsKey(controller.selectedCategory.value.attrCode)
                        ? controller.selectedMap.update(controller.selectedCategory.value.attrCode!, (value) {
                            List tempVal = value;
                            // debugPrint( value.toString().replaceAll("[", "").replaceAll("]", "").removeAllWhitespace);
                            value.contains(category?.value)
                                ? tempVal.remove(category?.value)
                                : tempVal.add(category?.value);
                            return tempVal;
                          })
                        : controller.selectedMap.addAll({
                            (controller.selectedCategory.value.attrCode ?? ''): [category?.value]
                          });
                  } else {
                    controller.selectedMap.containsKey(controller.selectedCategory.value.attrCode)
                        ? controller.selectedMap.update(controller.selectedCategory.value.attrCode!, (value) {
                            List tempVal = value;
                            value.contains(category?.value)
                                ? tempVal.remove(category?.value)
                                : tempVal.add(category?.value);
                            return tempVal;
                          })
                        : controller.selectedMap.addAll(
                            {
                              controller.selectedCategory.value.attrCode!: [category?.value]
                            },
                          );
                  }
                  debugPrint(controller.selectedMap.toString());
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Container(
                            height: 24.0,
                            width: 24.0,
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              children: [
                                Image.asset(
                                  (category?.isSelected.value ?? false) ? AppAsset.checkIcon : AppAsset.unCheckedIcon,
                                  height: 18.0,
                                  width: 18.0,
                                ),
                              ],
                            ),
                          )),
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
    );
  }

  Widget priceFilterWidget() {
    List<CheckBoxListTileModel> data1 = getData();
    return Column(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(width: 1, color: regularEDEDED), color: Colors.white),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: filterBackground,
                ),
                Text(
                  LanguageConstants.searchText.tr,
                  style: AppTextStyle.textStyleUtils400(color: filterBackground),
                ),
              ],
            )),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: false,
              itemCount: getData().length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: borderBlue,
                        dense: true,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          data1[index].title!,
                          style: AppTextStyle.textStyleUtils400(),
                        ),
                        value: data1[index].isCheck!,
                        onChanged: (bool? val) {})
                  ],
                );
              }),
        ),
      ],
    );
  }

  List<CheckBoxListTileModel> getData() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "\u{20B9} 500 - 1000", isCheck: true),
      CheckBoxListTileModel(title: "\u{20B9} 1500 - 2000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 2500 - 3000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 3500 - 4000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 4500 - 5000", isCheck: false),
      CheckBoxListTileModel(title: "\u{20B9} 5500 - 6000", isCheck: false),
    ];
  }
}
