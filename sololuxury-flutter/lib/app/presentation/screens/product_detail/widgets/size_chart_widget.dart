import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';

import '../../../../../all_imports.dart';

class SizeChartWidget extends GetView<ProductDetailController> {
  const SizeChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        imageDialog(
          LanguageConstants.sizeChartText.tr,
          controller.product?.value.getSizeChart() ?? '',
          context,
        );
      },
      child: CommonTextPoppins(
        LanguageConstants.sizeChartText.tr,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
        color: appColorButton,
        fontSize: 14.sp,
      ),
    );
  }
}

void imageDialog(String text, String path, BuildContext context) {
  showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return CommonAlertDialog(
        insetPadding: const EdgeInsets.all(20),
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: AppStyle.textStyleUtils500_16(color: appColor),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 16,
                    ),
                    color: appColor,
                  ),
                ],
              ),
            ),
            CachedNetworkImage(
                imageUrl: path,
                fit: BoxFit.cover,
                placeholder: (
                  BuildContext context,
                  String url,
                ) {
                  return Container(
                    height: 300,
                    width: double.maxFinite,
                    color: grey.withOpacity(0.5),
                  );
                },
                errorWidget: (
                  BuildContext context,
                  String url,
                  dynamic error,
                ) {
                  return Image.asset(AppAsset.logo);
                }),
          ],
        ),
      );
    },
  );
}
