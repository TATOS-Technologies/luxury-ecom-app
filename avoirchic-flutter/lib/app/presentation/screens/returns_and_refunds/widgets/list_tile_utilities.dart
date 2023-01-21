import 'package:avoirchic/app/controller/returns_and_refunds_controller.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileUtilities extends GetView<ReturnsAndRefundsController> {
  final VoidCallback? onTap;
  final bool isSelected;
  final String? title;

  const ListTileUtilities({Key? key, this.title, required this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
