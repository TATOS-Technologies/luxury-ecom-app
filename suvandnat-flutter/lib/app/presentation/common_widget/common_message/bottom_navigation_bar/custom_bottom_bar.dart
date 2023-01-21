import 'package:flutter/material.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/screens/about_us/about_us_screen.dart';
import 'package:get/get.dart';
import 'package:suvandnat/app/presentation/screens/refer_friend/refer_friend_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        detailsButton(LanguageConstants.aboutUsText.tr, 1),
        Visibility(
          visible: index == 1 ? true : false,
          child: Container(
            width: double.infinity,
            color: const Color(0xff973133),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LanguageConstants.helpTheNeedyText.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const AboutUsScreen());
                  },
                  child: Text(
                    LanguageConstants.aboutUsText.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ReferFriendScreen());
                  },
                  child: Text(
                    LanguageConstants.referFriendText.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LanguageConstants.returnsRefundsText.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LanguageConstants.faqText.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        detailsButton(LanguageConstants.socialText.tr, 3),
        detailsButton(LanguageConstants.contactText.tr, 2),
        detailsButton(LanguageConstants.newsletterText.tr, 4),
      ],
    );
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (index == value) {
          setState(() {
            index = 0;
          });
        } else {
          setState(() {
            index = value;
          });
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0xff973133),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            const SizedBox(width: 10),
            text == "About us"
                ? Icon(
                    index == 1 ? Icons.remove : Icons.add,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
          ],
        ),
      ),
    );
  }
}
