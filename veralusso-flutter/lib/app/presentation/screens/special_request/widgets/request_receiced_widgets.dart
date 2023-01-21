import 'package:flutter/material.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:get/get.dart';

class RequestReceivedWidgets extends StatelessWidget {
  const RequestReceivedWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(
            LanguageConstants.yourRequestHasBeenReceived.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400_18(),
          ),
          const SizedBox(height: 10),
          Text(
            LanguageConstants.youCanViewYourRequestsAtMyTickets.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.textStyleUtils400(),
          ),
        ],
      ),
    );
  }
}
