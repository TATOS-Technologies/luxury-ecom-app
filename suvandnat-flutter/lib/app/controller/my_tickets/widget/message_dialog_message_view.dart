import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta_package/translations/translations.dart';
import 'package:suvandnat/app/core/const/app_constants.dart';
import 'package:meta_package/api/models/my_ticket/ticket_messages_model.dart';

class MessageDialogMessageView extends StatelessWidget {
  const MessageDialogMessageView({
    Key? key,
    required this.getTicketMessagesData,
  }) : super(key: key);
  final Rx<TicketData> getTicketMessagesData;

  @override
  Widget build(BuildContext context) {
    return getTicketMessagesData.value.messages != null
        ? (getTicketMessagesData.value.messages?.isNotEmpty ?? false)
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:
                        getTicketMessagesData.value.messages?.length ?? 0,
                    itemBuilder: (context, item) => Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.2)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    LanguageConstants.message.tr,
                                    style:const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    getMessage(item),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Expanded(
                                  child: Text(
                                    LanguageConstants.date.tr,
                                    style:const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    getMessagesDate(item),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Expanded(
                                  child: Text(
                                    LanguageConstants.time.tr,
                                    style:const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    getMessagesTime(item),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Expanded(
                                  child: Text(
                                    LanguageConstants.sentBy.tr,
                                    style:const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    getTicketMessagesData
                                            .value.messages![item].sendBy ??
                                        '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Expanded(
                                  child: Text(
                                    LanguageConstants.status.tr,
                                    style:const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    getTicketMessagesData.value.status ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontFamily: AppConstants.fontPoppins,
                                        fontSize: 13),
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
                  ),
                ],
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
                          style:const TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              fontSize: 13),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          getMessage(0),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: AppConstants.fontPoppins,
                              fontSize: 13),
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
                      style:const TextStyle(
                          fontFamily: AppConstants.fontPoppins, fontSize: 13),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      getMessage(0),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  String getMessage(int item) {
    return getTicketMessagesData.value.messages != null
        ? (getTicketMessagesData.value.messages?.isNotEmpty ?? false)
            ? (getTicketMessagesData.value.messages?[item].message ?? '')
            :  LanguageConstants.thereAreNoMessages.tr
        :  LanguageConstants.thereAreNoMessages.tr;
  }

  String getMessagesTime(int index) {
    return (getTicketMessagesData.value.messages?[index].createdAt ?? '')
            .isEmpty
        ? ''
        : DateFormat('HH:mm:ss').format(
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(
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
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(
              getTicketMessagesData.value.messages?[index].createdAt
                      .toString() ??
                  '',
            ),
          );
  }
}
