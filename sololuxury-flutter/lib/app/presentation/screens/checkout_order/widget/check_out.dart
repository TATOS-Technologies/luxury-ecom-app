import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

import '../../../../../all_imports.dart';
import 'checkout_form.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeBackground,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 35.w),
                child: CommonTextPoppins(
                  LanguageConstants.purchaseText.tr,
                  textAlign: TextAlign.center,
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              localStore.customerToken.toString() == ""
                  ? SizedBox(
                      child: CommonThemeButton(
                       onTap: () {
                          Get.toNamed<dynamic>(
                            RoutesConstants.loginScreen,
                          );
                        },
                       title:
                          LanguageConstants.signInText.tr,
                          
                      )
                    )
                  : Container(),
              const SizedBox(
                height: 20.0,
              ),
              const CheckOutForm(),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
