import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/faq/faq_controller.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_theme_button.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';

import 'expansion_til.dart';

class PageviewWidget extends GetView<FaqController>{
  const PageviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              LanguageConstants.faqTitle.tr,
              style: AppTextStyle.textStyleUtilsUnderLine16(
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35.w,
                    child: TextField(
                      controller: controller.feqText,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: borderGrey, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          // contentPadding:
                          //     const EdgeInsets.only(top: 10, left: 15),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: borderGrey, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: borderGrey, width: 2),
                              borderRadius: BorderRadius.circular(12)),
                          counterText: '',
                          prefixIconConstraints: const BoxConstraints(
                            minHeight: 18,
                            minWidth: 46,
                          ),
                          hintText: LanguageConstants.faqText.tr,
                          filled: true,
                          fillColor: whiteColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 35.w,
                  child: CommonThemeButton(
                    onTap: () {
                      controller.getFaqList.refresh();
                    },
                    title: LanguageConstants.highlightText.tr,
                  ),
                ),
              ],
            ),
            if (controller.getFaqList.isEmpty)
              const SizedBox()
            else
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFaqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  debugPrint(
                      "DATADATA ========${controller.getFaqList[index].title.toString()}");
                  return ExpansionTil(
                    verticalVisualDensity: -1,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      controller.getFaqList[index].title.toString(),
                      style: AppTextStyle.textStyleUtils400(),
                    ),
                    // isIcon: controller.getFaqList.isEmpty ? true : false,
                    children: [
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Html(
                          data: controller.getFaqList[index].description
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