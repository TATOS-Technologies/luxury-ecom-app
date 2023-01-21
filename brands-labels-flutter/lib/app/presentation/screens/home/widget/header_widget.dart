import 'package:brandslabels/app/core/utils/app_routes.dart';
import 'package:brandslabels/app/presentation/screens/cart/cart_screen.dart';
import 'package:brandslabels/app/theme/app_asset.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';
import '../../order_confirmation/order_confirmation_screen.dart';

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
          InkWell(
            onTap: () {
              Get.to(const OrderConfirmationPage());
            },
            child: Text(
              'UNITED KINGDOM',
              style: AppTextStyle.textStyleUtils500(size: 11),
            ),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          Text(
            LanguageConstants.bgbp.tr,
            style: AppTextStyle.textStyleUtils500(size: 11),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          Text(
            'ENGLISH',
            style: AppTextStyle.textStyleUtils500(size: 11),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          const Spacer(),
          GestureDetector(
              onTap: () {},
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
                Get.to(() => const CartScreen());
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
