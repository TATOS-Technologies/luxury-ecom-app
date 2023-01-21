import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/lang_directory/language_constant.dart';

class MessageListDialog extends StatelessWidget {
  const MessageListDialog({Key? key, required this.ticket}) : super(key: key);
  final TicketData ticket;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ticket.messages != null
          ? ticket.messages?.isNotEmpty ?? false
              ? ListView.builder(
                  itemCount: ticket.messages?.length ?? 0,
                  itemBuilder: (context, item) => Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.2)),
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
                                  LanguageConstants.message,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessage(item),
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
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
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessagesDate(item),
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
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
                                  LanguageConstants.time,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  getMessagesTime(item),
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
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
                                  LanguageConstants.sentBy,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  ticket.messages![item].sendBy ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
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
                                  LanguageConstants.status,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  ticket.status ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppTextStyle.textStyleUtils400(size: 13),
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
                            LanguageConstants.message,
                            style: AppTextStyle.textStyleUtils400(size: 13),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            getMessage(0),
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStyleUtils400(size: 13),
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
                        LanguageConstants.message,
                        style: AppTextStyle.textStyleUtils400(size: 13),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        getMessage(0),
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.textStyleUtils400(size: 13),
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
    return ticket.messages != null
        ? ticket.messages?.isNotEmpty ?? false
            ? (ticket.messages![item].message ?? '')
            : LanguageConstants.thereAreNoMessages.tr
        : LanguageConstants.thereAreNoMessages.tr;
  }

  String getMessagesTime(int index) {
    return (ticket.messages?[index].createdAt ?? '').isEmpty
        ? ''
        : DateFormat('HH:mm:ss').format(
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              ticket.messages?[index].createdAt.toString() ?? '',
            ),
          );
  }

  String getMessagesDate(int index) {
    return (ticket.messages?[index].createdAt ?? '').isEmpty
        ? ''
        : DateFormat('yyyy-MM-dd').format(
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              ticket.messages?[index].createdAt.toString() ?? '',
            ),
          );
  }
}
