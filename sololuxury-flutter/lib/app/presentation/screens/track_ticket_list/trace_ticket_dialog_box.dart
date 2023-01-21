import 'package:meta_package/api/models/my_ticket/track_ticket_modal.dart';
import 'package:solo_luxury/all_imports.dart';
import 'package:solo_luxury/app/core/const/app_style.dart';
import 'package:solo_luxury/app/presentation/common_widget/alert_dialog/common_alert_dialog.dart';
import 'package:solo_luxury/app/presentation/screens/my_tickets/widgets/message_dialog_message_view.dart';

class TraceMessageDialog extends StatelessWidget {
  TraceMessageDialog({Key? key, required this.ticket}) : super(key: key);

  final TrackTicketController ticketsController = Get.find();
  final TrackTicketModal ticket;

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      backgroundColor: backGroundColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      contentWidget: Obx(
        () => SizedBox(
          width: double.maxFinite,
          height: getHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ticketsController.messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: appColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: appColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(
                          20,
                          10,
                          10,
                          10,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: appColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: appColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: ticketsController.isButtonTap.value &&
                                ticketsController.messageController.text == ''
                            ? LanguageConstants.pleaseEnterMessage.tr
                            : LanguageConstants.typeMessageHere.tr,
                        hintStyle:
                            AppStyle.textStyleUtils400(color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CommonButton(
                    buttonType: ButtonType.elevatedButton,
                    onPressed: () async {
                      ticketsController.isButtonTap.value = true;
                      ticketsController.update();
                      FocusNode().unfocus();
                      if (ticketsController.messageController.text != "") {
                        await ticketsController.addMessageToTicket(ticket);
                      }
                    },
                    color: appColor,
                    borderRadius: 8,
                    child: Text(
                      LanguageConstants.submitText.tr,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ticketsController.dialogLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        size: 16.0,
                        color: appColor,
                        // size: 50.0,
                      ),
                    )
                  : MessageDialogMessageView(
                      getTicketMessagesData:
                          ticketsController.getTicketMessagesData,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  double getHeight(BuildContext context) {
    return ticketsController.getTicketMessagesData.value.messages != null
        ? (ticketsController.getTicketMessagesData.value.messages?.isNotEmpty ??
                false)
            ? MediaQuery.of(context).size.height / 2
            : MediaQuery.of(context).size.height / 6
        : MediaQuery.of(context).size.height / 6;
  }
}
