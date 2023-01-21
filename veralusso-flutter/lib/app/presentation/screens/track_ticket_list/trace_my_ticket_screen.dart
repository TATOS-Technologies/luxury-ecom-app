import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:veralusso/app/core/utils/lang_directory/language_constant.dart';
import 'package:veralusso/app/controller/track_your_ticket_mail/track_ticket_controller.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';
import 'package:veralusso/app/theme/colors.dart';

class TrackTicketScreen extends GetView<TrackTicketController> {
  TrackTicketScreen({Key? key}) : super(key: key);

  @override
  final TrackTicketController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(
        title: LanguageConstants.myTicketsText.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              color: blackColor,
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
                        style: AppTextStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        LanguageConstants.nameChatText.tr.capitalizeFirst ?? '',
                        style: AppTextStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        LanguageConstants.actionText.tr.capitalizeFirst ?? '',
                        style: AppTextStyle.textStyleUtils500(color: Colors.white),
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
            Expanded(
              child: ListView.builder(
                itemCount: controller.trackTicketList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  TrackTicketModal ticket = controller.trackTicketList[index];
                  return Container(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            ticket.ticketCode ??
                                LanguageConstants.toBeUpdated.tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          flex: 2,
                          child: Text(
                            (ticket.keyword ?? '-').capitalizeFirst ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStyleUtils400(),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              controller.isButtonTap.value = false;
                              controller.showDialogBoxOpen(MyTicketList(
                                  ticketCode: ticket.ticketCode,
                                  email: ticket.email));
                            },
                            child: const Icon(
                              Icons.visibility_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
