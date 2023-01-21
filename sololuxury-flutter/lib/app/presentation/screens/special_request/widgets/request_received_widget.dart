import 'package:flutter/cupertino.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:get/get.dart';

import '../../../../core/const/app_style.dart';

class RequestReceivedWidget extends StatelessWidget {
  const RequestReceivedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(
            LanguageConstants.yourRequestHasBeenReceived.tr,
            textAlign: TextAlign.center,
            style: AppStyle.textStyleUtils500(size: 20)
                .copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 10),
          Text(
            LanguageConstants.youCanViewYourRequestsAtMyTickets.tr,
            textAlign: TextAlign.center,
            style: AppStyle.textStyleUtils400_16(),
          ),
        ],
      ),
    );
  }
}
