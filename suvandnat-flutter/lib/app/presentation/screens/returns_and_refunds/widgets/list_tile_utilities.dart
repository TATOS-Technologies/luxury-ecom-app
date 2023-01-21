import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/controller/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class ListTileUtilities extends GetView<ReturnsAndRefundsController> {
  final VoidCallback? onTap;
  final bool isSelected;
  final String? title;

  const ListTileUtilities(
      {Key? key, this.title, required this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: ListTile(
        onTap: onTap,
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          title!,
          maxLines: 2,
          style: AppTextStyle.textStyleUtils400_16(),
        ),
        trailing: isSelected
            ? const Icon(
                Icons.remove,
                color: Colors.black,
                size: 20,
              )
            : const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
      ),
    );
  }
}
