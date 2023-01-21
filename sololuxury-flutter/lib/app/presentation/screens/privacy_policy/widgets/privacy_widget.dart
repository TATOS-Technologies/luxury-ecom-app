// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class PrivacyWidget extends GetView<PrivacyPolicyController> {
  String text;
  String subText;
  int value;

  PrivacyWidget(this.text, this.subText, this.value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (controller.index.value == value) {
            controller.index.value = 0;
          } else {
            controller.index.value = value;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: controller.index.value != value
                      ? Border.all(color: Colors.transparent)
                      : const Border(
                          bottom: BorderSide(color: appColor),
                        ),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textStyleUtils500(size: 14.sp
                              ),
                      ),
                    ),
                    controller.index.value == value
                        ? const Icon(
                            Icons.remove,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.index.value == value ? true : false,
                child: Html(
                  data: subText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
