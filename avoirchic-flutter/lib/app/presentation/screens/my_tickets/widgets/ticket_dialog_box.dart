import 'package:avoirchic/app/core/utils/lang_directory/language_constant.dart';
import 'package:avoirchic/app/presentation/common_widgets/alert_dialog/common_alert_dialog.dart';
import 'package:avoirchic/app/theme/app_text_style.dart';
import 'package:meta_package/api/models/my_ticket/my_ticket_list.dart';
import 'package:avoirchic/app/controller/my_tickets_controller.dart';
import 'package:avoirchic/app/presentation/common_widgets/common_widget/common_text_opensans.dart';
import 'package:avoirchic/app/presentation/screens/my_tickets/widgets/message_list_widget.dart';
import 'package:avoirchic/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TicketDialogBox extends StatelessWidget {
  TicketDialogBox({Key? key, required this.ticket}) : super(key: key);

  final MyTicketList ticket;
  final MyTicketsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      backgroundColor: whiteColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      contentWidget: Obx(
        () => Container(
          width: double.maxFinite,
          height: getHeight(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: controller.messageController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 10, 10),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            hintText: LanguageConstants.typeMessageHere.tr,
                            hintStyle: AppTextStyle.textStyleUtils400(
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (controller.messageController.text.isNotEmpty) {
                          FocusNode().unfocus();
                          await controller.addMessageToTicket(ticket);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: appTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: CommonTextOpenSans(
                        LanguageConstants.submitText.tr,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.5,
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
                          size: 20,
                          color: avoirChickTheme,
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
