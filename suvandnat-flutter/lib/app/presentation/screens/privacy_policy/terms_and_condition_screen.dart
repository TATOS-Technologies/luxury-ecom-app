import 'package:flutter/material.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  _TermsAndConditionScreenState createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            Text(
              'TERMS AND CONDITION',
              style: AppTextStyle.textStyleUtils600(color: appColor, size: 18),
            ),
            const SizedBox(height: 20),
            expandDetailWidget('About Us', 1),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 1 ? true : false,
              child: Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: AppTextStyle.textStyleUtils500(
                    size: 13, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Our Services', 2),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 2 ? true : false,
              child: Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: AppTextStyle.textStyleUtils400(
                    size: 13, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Delivery', 3),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 3 ? true : false,
              child: Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: AppTextStyle.textStyleUtils400(
                    size: 13, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Our Website', 4),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 4 ? true : false,
              child: Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: AppTextStyle.textStyleUtils400(
                    size: 13, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),
            expandDetailWidget('Final Sale', 5),
            const SizedBox(height: 10),
            Visibility(
              visible: index == 5 ? true : false,
              child: Text(
                'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                style: AppTextStyle.textStyleUtils400(
                    size: 13, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandDetailWidget(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == value) {
            index = 0;
          } else {
            index = value;
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
              text,
              style: AppTextStyle.textStyleUtils400(),
            ),
            index == value
                ? const Icon(Icons.remove, color: appColor)
                : const Icon(Icons.add, color: appColor),
          ],
        ),
      ),
    );
  }
}
