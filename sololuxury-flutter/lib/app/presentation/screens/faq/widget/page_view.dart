import 'package:flutter_html/flutter_html.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/custom_expansion_tile.dart'
    as custom;

import '../../../../../all_imports.dart';

class CommonPageView extends GetView<FaqController> {
  const CommonPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: homeBackground,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(LanguageConstants.faqTitle.tr,
                  style: AppStyle.textStyleUtilsUnderline600(color: buttoncolor)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.feqText,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black.withOpacity(0.5), width: 1.0),
                            borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black.withOpacity(0.5), width: 1.0),
                            borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          counterText: '',
                          prefixIconConstraints: const BoxConstraints(
                            minHeight: 18,
                            minWidth: 46,
                          ),
                          hintText: LanguageConstants.faqText.tr,
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.getFaqList.refresh();
                      highlightText();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: appColorButton, borderRadius: BorderRadius.circular(0)),
                      child: Text(
                        LanguageConstants.highlightText.tr,
                        style: AppStyle.textStyleUtils400(size: 17, color: whiteColor),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFaqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  debugPrint("DATADATA ========${controller.getFaqList[index].title.toString()}");
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: custom.ExpansionTile(
                      tileHeight: 48,
                      initiallyExpanded: index == 0 ? true : false,
                      verticalVisualDensity: -1,
                      contentPadding: const EdgeInsets.only(left: 10, right: 20, top: 3),
                      title: Text(
                        controller.getFaqList[index].title.toString(),
                        style: AppStyle.textStyleUtils400(size: 18),
                      ),
                      isIcon: controller.getFaqList.isEmpty ? true : false,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          ),
                          child: Html(
                            data: controller.getFaqList[index].description.toString(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void highlightText() {
    for (int i = 0; i < controller.getFaqList.length; i++) {
      controller.getFaqList[i].description = controller.getFaqList[i].description
          .toString()
          .replaceAll("<span style='background-color:yellow'>", "");
      controller.getFaqList[i].description =
          controller.getFaqList[i].description.toString().replaceAll("</span>", "");

      String temp = controller.getFaqList[i].description!;

      int startValue = 0;
      int index = -1;
      String serchtext = controller.feqText.text.trim();
      if (serchtext.isNotEmpty) {
        do {
          index = temp.toUpperCase().indexOf(serchtext.toUpperCase(), startValue);
          if (index != -1) {
            String substring = temp.substring(index, index + serchtext.length);
            String changeHtml = "<span style='background-color:yellow'>$substring</span>";
            temp = temp.replaceRange(index, index + serchtext.length, changeHtml);
            startValue = index + changeHtml.length - serchtext.length;
          }
        } while (index != -1);
        controller.getFaqList[i].description = temp;
      }
    }
  }
}
