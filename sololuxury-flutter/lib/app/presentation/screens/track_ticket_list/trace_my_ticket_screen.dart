import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class TrackTicketScreen extends GetView<TrackTicketController> {
  const TrackTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: commonAppbar(
        title: LanguageConstants.myTicketsText.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Container(
              color: appColor,
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
                        style: AppStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        LanguageConstants.nameChatText.tr.capitalizeFirst ?? '',
                        style: AppStyle.textStyleUtils500(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        LanguageConstants.actionText.tr.capitalizeFirst ?? '',
                        style: AppStyle.textStyleUtils500(color: Colors.white),
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
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              flex: 2,
                              child: Text(
                                (ticket.keyword ?? '-').capitalizeFirst ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyle.textStyleUtils400(),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  controller.showDialogBoxOpen(
                                    ticket,
                                  );
                                },
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
