// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:solo_luxury/app/core/const/app_style.dart';

import '../../../../../all_imports.dart';

class ExpandDetailWidget extends StatefulWidget {
  String text;
  int value;
  int index;

  ExpandDetailWidget({
    Key? key,
    required this.text,
    required this.value,
    required this.index,
  }) : super(key: key);

  @override
  State<ExpandDetailWidget> createState() => _ExpandDetailWidgetState();
}

class _ExpandDetailWidgetState extends State<ExpandDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.index == widget.value) {
            widget.index = 0;
          } else {
            widget.index = widget.value;
          }
        });
      },
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: AppStyle.textStyleUtils400(),
            ),
            widget.index == widget.value
                ? const Icon(Icons.remove, color: appColor)
                : const Icon(Icons.add, color: appColor),
          ],
        ),
      ),
    );
  }
}
