import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/controller/search/search_controller.dart';
import 'package:veralusso/app/core/const/app_style.dart';
import 'package:meta_package/meta_package.dart';
import 'package:veralusso/app/theme/colors.dart';

class FilterDropDown extends GetView<SearchController> {
  @override
  final SearchController controller = Get.find();
  FilterDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: grey6D6D6D, width: 1.4),
          ),
          child: TextFormField(
            controller: controller.txtList,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: LanguageConstants.searchText.tr,
              hintStyle: AppStyle.commonTextStyle400(color: Colors.black54),
            ),
            onChanged: (val) {
              controller.getSearchData(argument: val);
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.search,
          color: Colors.black54,
        )
      ],
    );
  }
}
