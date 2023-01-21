import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:suvandnat/app/core/utils/lang_directory/language_constant.dart';
import 'package:suvandnat/app/presentation/common_widget/common_animations/nothing_to_show_animation.dart';
import 'package:suvandnat/app/presentation/common_widget/common_appbar.dart';
import 'package:suvandnat/app/presentation/app_routes.dart';
import 'package:suvandnat/app/presentation/common_widget/common_background/common_backkgroud.dart';
import 'package:suvandnat/app/presentation/common_widget/headline_body_one_base_widget.dart';
import 'package:suvandnat/app/theme/app_text_style.dart';
import 'package:suvandnat/app/theme/colors.dart';
import '../../../controller/my_tickets/my_tickets_controller.dart';

class MyTicketsScreen extends GetView<MyTicketsController> {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBacground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: commonAppbar(title: LanguageConstants.myTicketsText.tr),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: SpinKitThreeBounce(color: appColorPrimary),
                )
              : Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      controller.getTicketList.isNotEmpty
                          ? Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    // border: Border.all(color: borderGrey,width: 2)
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Get.width,
                                        decoration: const BoxDecoration(
                                            color: blueTileColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                LanguageConstants.idText.tr,
                                                style: AppTextStyle
                                                    .textStyleUtils500_16(),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  LanguageConstants.nameText.tr,
                                                  style: AppTextStyle
                                                      .textStyleUtils500_16(),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  LanguageConstants
                                                      .actionText.tr,
                                                  style: AppTextStyle
                                                      .textStyleUtils500_16(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount:
                                                controller.getTicketList.length,
                                            itemBuilder: (context, index) {
                                              final ticket = controller
                                                  .getTicketList[index];
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                decoration: const BoxDecoration(
                                                    color: whiteColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      bottomRight:
                                                          Radius.circular(12),
                                                    )),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        ticket.ticketCode ??
                                                            LanguageConstants
                                                                .toBeUpdated.tr,
                                                        style: AppTextStyle
                                                                .textStyleUtils400()
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        (ticket.keyword ?? '-')
                                                                .capitalizeFirst ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyle
                                                                .textStyleUtils400()
                                                            .copyWith(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller.isButtonTap
                                                              .value = false;
                                                          controller
                                                              .showDialogBoxOpen(
                                                                  ticket);
                                                        },
                                                        child: const Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Icon(
                                                            Icons
                                                                .visibility_outlined,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
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
                                  const NothigToShowAnimationWidget(),
                                  Text(
                                    LanguageConstants.youHaveNoTickets.tr,
                                    style: AppTextStyle.normalRegular14,
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: appColorPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Get.toNamed(
                                              RoutesConstants.contactUsScreen)!
                                          .then((value) {
                                        controller.isLoading.value = true;
                                        controller.getMyTicket();
                                      });
                                    },
                                    child: HeadlineBodyOneBaseWidget(
                                      title:
                                          LanguageConstants.createNewTicket.tr,
                                      titleColor: Colors.white,
                                      fontFamily: AppConstants.fontPoppins,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
