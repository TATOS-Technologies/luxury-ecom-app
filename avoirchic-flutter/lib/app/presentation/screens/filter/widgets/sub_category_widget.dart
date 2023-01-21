import 'package:avoirchic/app/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/filter/filter_model.dart';
import 'package:meta_package/translations/translations.dart';
import '../../../../theme/app_asset.dart';
import '../../../../theme/app_text_style.dart';
import '../../../common_widgets/common_widget/common_text_opensans.dart';

class SubCategoryWidget extends GetView<FilterController> {
  const SubCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
            left: 5.0, right: 10.0, top: 10.0, bottom: 10.0),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: const Color(0xff367587))),
        child: subCategoryWidget(),
      ),
    );
  }

  Widget subCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0xff367587))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Image.asset(
                  AppAsset.search1,
                  color: const Color(0xff367587).withOpacity(0.6),
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
                          hintStyle: AppTextStyle.textStyleUtils400(
                              color: const Color(0xff367587).withOpacity(0.6),
                              size: 13),
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
            )),
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
                    controller.selectedMap.containsKey(
                            controller.selectedCategory.value.attrCode)
                        ? controller.selectedMap
                            .update(controller.selectedCategory.value.attrCode!,
                                (value) {
                            List tempVal = value;

                            value.contains(category?.value)
                                ? tempVal.remove(category?.value)
                                : tempVal.add(category?.value);
                            return tempVal;
                          })
                        : controller.selectedMap.addAll({
                            controller.selectedCategory.value.attrCode!: [
                              category?.value
                            ]
                          });
                  } else {
                    controller.selectedMap.containsKey(
                            controller.selectedCategory.value.attrCode)
                        ? controller.selectedMap.update(
                            controller.selectedCategory.value.attrCode ?? '',
                            (value) {
                            List tempVal = value;
                            value.contains(category?.value)
                                ? tempVal.remove(category?.value)
                                : tempVal.add(category?.value);
                            return tempVal;
                          })
                        : controller.selectedMap.addAll({
                            controller.selectedCategory.value.attrCode!: [
                              category?.value
                            ]
                          });
                  }
                  debugPrint('${controller.selectedMap}');
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Container(
                          height: 24.0,
                          width: 24.0,
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              Image.asset(
                                category?.isSelected.value ?? false
                                    ? AppAsset.checkIcon
                                    : AppAsset.uncheckIcon,
                                height: 18.0,
                                width: 18.0,
                              ),
                            ],
                          ),
                        ),
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
    );
  }
}
