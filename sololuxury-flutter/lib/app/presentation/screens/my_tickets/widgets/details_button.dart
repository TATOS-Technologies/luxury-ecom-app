// ignore_for_file: must_be_immutable

import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class DetailsButton extends GetView<MyTicketsController> {
  String text;
  int value;

  DetailsButton(this.text, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value == 1) {
          controller.aboutUsExpandableController.toggle();
        }
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyle.textStyleUtils400(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
