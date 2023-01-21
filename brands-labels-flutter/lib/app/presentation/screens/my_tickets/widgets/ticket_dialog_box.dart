import 'package:brandslabels/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:brandslabels/app/controller/my_ticket_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_button.dart';
import 'package:brandslabels/app/presentation/screens/my_tickets/widgets/message_list_widget.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/translations/translations.dart';

class TicketDialogBox extends StatelessWidget {
  TicketDialogBox({Key? key, required this.ticket}) : super(key: key);

  final MyTicketList ticket;
  final MyTicketsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      backgroundColor: whiteColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      contentWidget: Obx(
        () => SizedBox(
          width: double.maxFinite,
          height: getHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                width: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: darkBlue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: LanguageConstants.typeMessageHere.tr,
                        hintStyle: AppTextStyle.textStyleUtils400(
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CommonButton(
                    buttonType: ButtonType.ElevatedButton,
                    onPressed: () async {
                      if (controller.messageController.text.isNotEmpty) {
                        FocusNode().unfocus();
                        await controller.addMessageToTicket(ticket);
                      }
                    },
                    color: darkBlue,
                    borderRadius: 8,
                    child: Text(
                      LanguageConstants.submitText.tr,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              controller.dialogLoading.value
                  ? const Center(
                      child: SpinKitThreeBounce(
                        color: darkBlue,
                        // size: 50.0,
                      ),
                    )
                  : MessageListDialog(
                      ticket: controller.getTicketMessagesData.value,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  double getHeight(BuildContext context) {
    return controller.getTicketMessagesData.value.messages != null
        ? controller.getTicketMessagesData.value.messages?.isNotEmpty ?? false
            ? MediaQuery.of(context).size.height / 2
            : MediaQuery.of(context).size.height / 6
        : MediaQuery.of(context).size.height / 6;
  }
}
