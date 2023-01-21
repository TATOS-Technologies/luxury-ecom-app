// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class ExpandedDetailedWidget extends StatelessWidget {
  String? text;
  VoidCallback onTap;
  bool isTapped;

  ExpandedDetailedWidget({
    Key? key,
    this.text,
    required this.onTap,
    required this.isTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: AppStyle.textStyleUtils400(size: 10.0),
            ),
            isTapped
                ? const Icon(
                    Icons.expand_more,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
          ],
        ),
      ),
    );
  }
}
