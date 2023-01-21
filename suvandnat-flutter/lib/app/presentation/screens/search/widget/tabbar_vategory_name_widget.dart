import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/search/search_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

class TabBarCategoryNameWidget extends GetView<SearchController> {
  const TabBarCategoryNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.0, color: appColor),
          insets: EdgeInsets.symmetric(horizontal: 16.0)),
      indicatorColor: red973133,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: red973133,
      isScrollable: true,
      unselectedLabelColor: gray6D6D6D,
      unselectedLabelStyle: AppTextStyle.textStyleUtils500(size: 18.0),
      labelStyle: AppTextStyle.textStyleUtils500(size: 18.0),
      tabs: List<Widget>.generate(
          controller.menuModel?.value.childrenData?.length ?? 0, (int index) {
        return Tab(
          height: 15,
          child: Text(
            controller.menuModel?.value.childrenData?[index].name ?? '',
            style: AppTextStyle.textStyleUtils500_12(),
          ),
        );
      }),
    );
  }
}
