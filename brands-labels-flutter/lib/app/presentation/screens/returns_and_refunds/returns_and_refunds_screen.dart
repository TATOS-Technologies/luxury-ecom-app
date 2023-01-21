import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/returns_and_refunds_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/screens/faq/faq_screen.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: commonAppbar(title: LanguageConstants.returnsRefundsText.tr),
        body: pageView(),
      ),
    );
  }

  Widget listTileUtilities(
      {VoidCallback? onTap, bool isSelected = false, String? title}) {
    return Container(
      height: 25,
      alignment: Alignment.center,
      child: ListTile(
        onTap: onTap,
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          title!,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        trailing: isSelected
            ? const Icon(
                Icons.remove,
                color: Colors.black,
              )
            : const Icon(
                Icons.add,
                color: Colors.black,
              ),
      ),
    );
  }

  Widget contain({bool isSelected = false, String? contain}) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(
              contain!,
              style: AppTextStyle.textStyleUtils400(),
            ),
          )
        : const SizedBox();
  }

  Widget bulletList({required List<String> strings, bool isSelected = false}) {
    return isSelected
        ? Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: strings.map((str) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u2022',
                      style: AppTextStyle.textStyleUtils400().copyWith(
                        height: 1.30,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        str,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.textStyleUtils400().copyWith(
                          height: 1.30,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getReturnsList.length,
              // itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                debugPrint(
                    "DATADATA ========${controller.getReturnsList[index].title.toString()}");
                return ExpansionTil(
                  verticalVisualDensity: -1,
                  iconColor: blackColor,
                  contentPadding: const EdgeInsets.only(bottom: 20),
                  title: Text(
                    controller.getReturnsList[index].title.toString(),
                    style: AppTextStyle.textStyleUtils400_16(),
                  ),
                  isIcon: controller.getReturnsList.isEmpty ? true : false,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Html(
                        data: controller.getReturnsList[index].description
                            .toString(),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
