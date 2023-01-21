import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_text_opensans.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';
import 'package:veralusso/app/controller/my_tickets/my_tickets_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_message/app_routes.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';

class MyTicketScreen extends GetView<MyTicketsController> {
  @override
  final MyTicketsController controller = Get.find();

  MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(title: LanguageConstants.myTicketsText.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                  // size: 50.0,
                ),
              )
            : controller.getTicketList.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              width: 1,
                              color: blackColor,
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  LanguageConstants.idText.tr,
                                  style: AppTextStyle.textStyleUtils500_16(),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    LanguageConstants.nameText.tr,
                                    style: AppTextStyle.textStyleUtils500_16(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    LanguageConstants.actionText.tr,
                                    style: AppTextStyle.textStyleUtils500_16(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: controller.getTicketList.length,
                              itemBuilder: (context, index) {
                                final ticket = controller.getTicketList[index];
                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 14, bottom: 14),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: blackColor,
                                        width: 1,
                                      ),
                                      right: BorderSide(
                                        color: blackColor,
                                        width: 1,
                                      ),
                                      left: BorderSide(
                                        color: blackColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          ticket.ticketCode ??
                                              LanguageConstants.toBeUpdated.tr,
                                          style:
                                              AppTextStyle.textStyleUtils400()
                                                  .copyWith(
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          (ticket.keyword ?? '-')
                                                  .capitalizeFirst ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyle.textStyleUtils400()
                                                  .copyWith(
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.isButtonTap.value =
                                                false;
                                            controller
                                                .showDialogBoxOpen(ticket);
                                          },
                                          child: const Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.visibility_outlined,
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
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LanguageConstants.youHaveNoTickets.tr,
                            style: AppTextStyle.normalRegular14,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(
                                RoutesConstants.specialRequestScreen,
                                arguments: ['', "category"],
                              )!
                                  .then(
                                (value) {
                                  controller.getMyTicket();
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              backgroundColor: blackColor,
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
                    ),
                  ),
      ),
    );
  }
}
