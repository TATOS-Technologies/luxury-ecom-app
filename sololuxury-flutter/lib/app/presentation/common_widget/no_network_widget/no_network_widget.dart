import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_animations/no_internet_animation.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: homeBackground,
        appBar: AppBar(
            backgroundColor: homeBackground,
            // elevation: 0,
            title: SizedBox(
                height: 20.h,
                width: 111.w,
                child: Image.asset(
                  AppAsset.appbarLogo,
                ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const NoInternetAnimationWidget(),
            Text(
              LanguageConstants.noInternet.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: grey636363,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ));
  }
}
