import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/theme/app_asset.dart';
import 'package:suvandnat/app/presentation/screens/cart/cart_screen.dart';
import 'package:suvandnat/app/presentation/screens/search/search_screen.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            LanguageConstants.unitedKingdomText.tr,
            style: AppTextStyle.textStyleUtils500(size: 11),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          Text(
            LanguageConstants.gbpText.tr,
            style: AppTextStyle.textStyleUtils500(size: 11),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          Text(
            LanguageConstants.englishText.tr,
            style: AppTextStyle.textStyleUtils500(size: 11),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Get.to(
                  () => SearchScreen(),
                );
              },
              child: SvgPicture.asset(AppAsset.search, height: 12.5)),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () async {
                await Future.delayed(const Duration(seconds: 2), () async {
                  Get.toNamed(RoutesConstants.wishlistScreen);
                });
              },
              child: SvgPicture.asset(AppAsset.heart, height: 12.5)),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: SvgPicture.asset(AppAsset.cart,
                  color: Colors.black, height: 12.5)),
          const SizedBox(width: 2),
          const Text('0'),
        ],
      ),
    );
  }
}
