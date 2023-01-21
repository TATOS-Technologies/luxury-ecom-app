// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_montserrat.dart';
import 'package:veralusso/app/theme/app_asset.dart';

class TitleWithArrow extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const TitleWithArrow({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.0,
        margin: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextMontserrat(
              title ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.0,
              width: 18.0,
              child: Center(
                child: Image.asset(
                  AppAsset.rightArrow1,
                  height: 10.0,
                  width: 10.0,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
