import 'package:intl/intl.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';

class MessageDialogMessageView extends StatelessWidget {
  const MessageDialogMessageView({
    Key? key,
    required this.getTicketMessagesData,
  }) : super(key: key);
  final Rx<TicketData> getTicketMessagesData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: getTicketMessagesData.value.messages != null
          ? (getTicketMessagesData.value.messages?.isNotEmpty ?? false)
              ? ListView.builder(
                  itemCount: getTicketMessagesData.value.messages?.length ?? 0,
                  itemBuilder: (context, item) => Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.2)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  LanguageConstants.message.tr,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessage(item),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                 LanguageConstants.date.tr,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessagesDate(item),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  LanguageConstants.time.tr,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessagesTime(item),
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  LanguageConstants.sentBy.tr,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getTicketMessagesData
                                          .value.messages![item].sendBy ??
                                      '',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                 LanguageConstants.status.tr,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getTicketMessagesData.value.status ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textStyleUtils400(size: 13),
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            LanguageConstants.message.tr,
                            style: AppStyle.textStyleUtils400(size: 13),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            getMessage(0),
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.textStyleUtils400(size: 13),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        LanguageConstants.message.tr,
                        style: AppStyle.textStyleUtils400(size: 13),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        getMessage(0),
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textStyleUtils400(size: 13),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  String getMessage(int item) {
    return getTicketMessagesData.value.messages != null
        ? (getTicketMessagesData.value.messages?.isNotEmpty ?? false)
            ? (getTicketMessagesData.value.messages![item].message ?? '')
            : LanguageConstants.thereAreNoMessages.tr
        : LanguageConstants.thereAreNoMessages.tr;
  }

  String getMessagesTime(int index) {
    return (getTicketMessagesData.value.messages?[index].createdAt ?? '')
            .isEmpty
        ? ''
        : DateFormat('HH:mm:ss').format(
            DateTime.parse(
              getTicketMessagesData.value.messages?[index].createdAt
                      .toString() ??
                  '',
            ),
          );
  }

  String getMessagesDate(int index) {
    return (getTicketMessagesData.value.messages?[index].createdAt ?? '')
            .isEmpty
        ? ''
        : DateFormat('yyyy-MM-dd').format(
            DateTime.parse(
              getTicketMessagesData.value.messages?[index].createdAt
                      .toString() ??
                  '',
            ),
          );
  }
}
