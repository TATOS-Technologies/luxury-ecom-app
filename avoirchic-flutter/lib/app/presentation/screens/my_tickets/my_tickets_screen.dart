import 'package:avoirchic/app/core/utils/app_routes.dart';
import 'package:avoirchic/app/controller/my_tickets_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MyTicketScreen extends GetView<MyTicketsController> {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(LanguageConstants.myTicketsText.tr),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: appBorderColor,
                  // size: 50.0,
                ),
              )
            : Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    // commonAppbar(appBarColor: Colors.transparent),
                    const SizedBox(
                      height: 20.0,
                    ),

                    controller.getTicketList.isNotEmpty
                        ? Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: borderGrey, width: 2)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: blueTileColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    padding: EdgeInsets.all(10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            LanguageConstants.idText.tr
                                                    .capitalizeFirst ??
                                                '',
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            LanguageConstants.nameChatText.tr
                                                    .capitalizeFirst ??
                                                '',
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            LanguageConstants.actionText.tr
                                                    .capitalizeFirst ??
                                                '',
                                            style: AppTextStyle
                                                .textStyleUtils500(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: borderGrey,
                                    thickness: 2,
                                    height: 2,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      ticket.ticketCode ??
                                                          LanguageConstants
                                                              .toBbeUpdated.tr,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      (ticket.keyword ?? '-')
                                                              .capitalizeFirst ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppTextStyle
                                                          .textStyleUtils400(),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .showDialogBoxOpen(
                                                                ticket);
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .visibility_outlined,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height: Get.height / 1.8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(LanguageConstants.youHaveNoTickets.tr,
                                    style: AppTextStyle.textStyleUtils400()),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.offAndToNamed(
                                      RoutesConstants.specialRequesScreen,
                                      arguments: ['', "category"],
                                    )!
                                        .then((value) {
                                      controller.isLoading.value = true;
                                      controller.getMyTicket();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 1,
                                    backgroundColor: appTextColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: CommonTextOpenSans(
                                    LanguageConstants.createTicket.tr,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.5,
                                  ),
                                )
                              ],
                            ),
                          )
                  ],
                ),
              ),
      ),
    );
  }
}
