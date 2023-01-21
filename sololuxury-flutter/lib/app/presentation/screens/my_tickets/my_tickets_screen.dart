import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/common_widget/common_theme_button.dart';

class MyTicketScreen extends GetView<MyTicketsController> {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(title: LanguageConstants.myTicketsText.tr),
      body: Obx(
        () => Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 14.0),
                const SizedBox(height: 14.0),
                controller.getTicketList.isNotEmpty
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: homeBackground,
                                    border: Border.all(
                                        color: appTileBorderColor, width: 2)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40.h,
                                      decoration: const BoxDecoration(
                                          color: appTileBGcolor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                          vertical: 2.w,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: CommonTextPoppins(
                                                LanguageConstants.idText.tr
                                                        .capitalizeFirst ??
                                                    '',
                                                color: appColorPrimary,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: CommonTextPoppins(
                                                LanguageConstants.nameChatText
                                                        .tr.capitalizeFirst ??
                                                    '',
                                                color: appColorPrimary,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: CommonTextPoppins(
                                                LanguageConstants.actionText.tr
                                                        .capitalizeFirst ??
                                                    '',
                                                color: appColorPrimary,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      // padding:const EdgeInsets.all(20),
                                      itemCount:
                                          controller.getTicketList.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final ticket =
                                            controller.getTicketList[index];
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 15.w,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: CommonTextPoppins(
                                                      ticket.ticketCode ??
                                                          LanguageConstants
                                                              .toBeUpdated.tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CommonTextPoppins(
                                                      (ticket.keyword ?? '-')
                                                              .capitalizeFirst ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller.isButtonTap
                                                            .value = false;
                                                        controller.update();
                                                        controller
                                                            .showDialogBoxOpen(
                                                                ticket);
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .visibility_outlined,
                                                        color: appColorPrimary,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : controller.isLoading.value
                        ? const SizedBox()
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LanguageConstants.youHaveNoTickets.tr,
                                  style: AppStyle.textStyleUtils400(),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      CommonThemeButton(
                                        onTap: () {
                                          Get.toNamed<dynamic>(
                                            RoutesConstants.specialRequesScreen,
                                            arguments: ['', "category"],
                                          )!
                                              .then(
                                            (value) {
                                              controller.getMyTicket();
                                            },
                                          );
                                        },
                                       title:
                                          LanguageConstants.createNewTicket.tr,
                                         
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
              ],
            ),
            controller.isLoading.value
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: appColor,
                      // size: 50.0,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
