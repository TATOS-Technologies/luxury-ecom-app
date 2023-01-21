import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:brandslabels/app/controller/my_ticket_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_routes.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';

class MyTicketPageScreen extends GetView<MyTicketsController> {
  const MyTicketPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.myTicketsText.tr),
      body: Obx(
        () => controller.isLoading.value == true
            ? const Center(
                child: SpinKitThreeBounce(
                color: appBarPrimary,
              ))
            : Center(
                child: Padding(
                  padding: EdgeInsets.all( 24.w),
                  child: Container(
                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: borderGrey,width: 2)
                              ),
                    child: Column(
                      children: [
                        
                        controller.getTicketList.isNotEmpty
                            ? Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width,
                                      decoration:const BoxDecoration(
                                        color: blueTileColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12)
                                        )
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            capitalizeFirstForString(
                                              LanguageConstants.idText.tr,
                                            ),
                                            style: AppTextStyle.textStyleUtils400_16(
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30.0),
                                            child: Text(
                                              capitalizeFirstForString(
                                                LanguageConstants.nameChatText.tr,
                                              ),
                                              style: AppTextStyle.textStyleUtils400_16(),
                                            ),
                                          ),
                                          Text(
                                            capitalizeFirstForString(
                                              LanguageConstants.actionText.tr,
                                            ),
                                            style: AppTextStyle.textStyleUtils400_16(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.getTicketList.length,
                                        itemBuilder: (context, index) {
                                          final MyTicketList ticket =
                                              controller.getTicketList[index];
                                          return Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8.0,
                                                    left: 12.0,
                                                    right: 25.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      ticket.ticketCode ??
                                                          LanguageConstants
                                                              .toBbeUpdated.tr,
                                                      style: AppTextStyle.textStyleUtils400(),
                                                    ),
                                                    Container(
                                                      width: Get.width * 0.3,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 45.0),
                                                      child: Text(
                                                        capitalizeFirstForString(
                                                          ticket.keyword ?? '-',
                                                        ),
                                                        overflow:
                                                            TextOverflow.ellipsis,
                                                        style: AppTextStyle.textStyleUtils400(),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controller
                                                            .showDialogBoxOpen(
                                                          ticket,
                                                        );
                                                      },
                                                      child: const Icon(
                                                        Icons.visibility_outlined,
                                                        size: 16.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                height: Get.height / 1.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      LanguageConstants.youHaveNoTickets.tr,
                                      style: AppTextStyle.normalRegular14,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.offAndToNamed(
                                          RoutesConstants.specialRequestScreen,
                                          arguments: [
                                            '',
                                            LanguageConstants.category.tr,
                                          ],
                                        )!
                                            .then((value) {
                                          controller.isLoading.value = true;
                                          controller.getMyTicket();
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        backgroundColor: appBarPrimary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: CommonTextOpenSans(
                                        LanguageConstants.createNewTicket.tr,
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
              ),
      ),
    );
  }

  String capitalizeFirstForString(String value) {
    return value.capitalizeFirst ?? '';
  }
}
