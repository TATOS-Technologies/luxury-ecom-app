import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:avoirchic/app/controller/track_ticket_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackTicketScreen extends GetView<TrackTicketController> {
  const TrackTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            commonAppbar(
              appBarColor: Colors.transparent,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              LanguageConstants.myTicketsText.tr,
              style: AppTextStyle.textStyleUtils500(size: 15),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.transparent,
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
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        LanguageConstants.nameChatText.tr.capitalizeFirst ?? '',
                        style: AppTextStyle.textStyleUtils500(),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        LanguageConstants.actionText.tr.capitalizeFirst ?? '',
                        style: AppTextStyle.textStyleUtils500(),
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
            ),
          ],
        ),
      ),
    );
  }
}
