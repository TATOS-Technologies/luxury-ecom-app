import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:brandslabels/app/controller/track_ticket_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackTicketScreen extends GetView<TrackTicketController> {
  const TrackTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: LanguageConstants.myTicketsText.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              color: darkBlue,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        LanguageConstants.idText.tr.capitalizeFirst ?? '',
                        style:
                            AppTextStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        LanguageConstants.nameChatText.tr.capitalizeFirst ?? '',
                        style:
                            AppTextStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        LanguageConstants.actionText.tr.capitalizeFirst ?? '',
                        style:
                            AppTextStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
            controller.trackTicketList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: controller.trackTicketList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        TrackTicketModal ticket =
                            controller.trackTicketList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      ticket.ticketCode ??
                                          LanguageConstants.toBbeUpdated.tr,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      (ticket.keyword ?? '-').capitalizeFirst ??
                                          '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {},
                                      child: const Icon(
                                        Icons.visibility_outlined,
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
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
