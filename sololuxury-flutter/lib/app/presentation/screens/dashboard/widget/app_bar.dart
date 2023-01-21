import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../all_imports.dart';

class CommonAppBar extends GetView<DashboardController> {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: homeBackground,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: SizedBox(
                  height: 40.h,
                  width: 130.w,
                  child: controller.tabController?.value.index == 0
                      ? Image.asset(
                          AppAsset.appbarLogo,
                        )
                      : Center(
                          child: CommonTextOpenSans(
                            controller.appbarTitle.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            fontSize: 14.sp,
                            color: appDarkText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: () {
                      debugPrint("onTap ->");
                      if (!(controller
                              .scaffoldKey.value.currentState?.isDrawerOpen ??
                          false)) {
                        controller.scaffoldKey.value.currentState?.openDrawer();
                      }
                    },
                    child: SizedBox(
                      height: 30.h,
                      width: 30.h,
                      child: Center(
                        child: SvgPicture.asset(
                          AppAsset.svgMenuIcon,
                          height: 20.h,
                          width: 20.h,
                          color: controller.tabController?.value.index == 0
                              ? appColorPrimary
                              : appDarkText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
