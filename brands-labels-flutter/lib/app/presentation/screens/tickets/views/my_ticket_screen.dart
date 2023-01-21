import 'package:brandslabels/app/core/utils/lang_directory/language_constant.dart';
import 'package:brandslabels/app/controller/my_ticket_screen_controller.dart';
import 'package:brandslabels/app/presentation/common_widgets/common_widget/common_appbar.dart';
import 'package:brandslabels/app/theme/app_text_style.dart';
import 'package:brandslabels/app/theme/colors.dart';
import 'package:brandslabels/app/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTicketPageScreen extends GetView<MyTicketScreenController> {
  const MyTicketPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: commonAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 110.0,
              ),
              Text(
                "MY TICKETS",
                style: AppTextStyle.textStyleUtilsUnderLine20(
                    color: darkBlue, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      color: const Color(0xffF0F0F0),
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageConstants.idText.tr,
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              LanguageConstants.nameChatText.tr,
                              style: AppTextStyle.textStyleUtils400_16(),
                            ),
                          ),
                          Text(
                            LanguageConstants.actionText.tr,
                            style: AppTextStyle.textStyleUtils400_16(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            showFancyCustomDialog_(context);
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                    left: 12.0,
                                    right: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "T20220207104515",
                                      style: AppTextStyle.textStyleUtils400(),
                                    ),
                                    Container(
                                      width: mediaQueryW * 0.3,
                                      margin:
                                          const EdgeInsets.only(right: 45.0),
                                      child: Text(
                                        "Special Request | Suvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv",
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.textStyleUtils400(),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.visibility_outlined,
                                      size: 16.0,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showFancyCustomDialog_(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: const RoundedRectangleBorder(),
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: const Alignment(1.00, -1.00),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.close, color: ThemeColors.textColor),
                ),
              ),
            ),
            Container(
              width: Get.width - 35,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1, color: ThemeColors.textColor)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "ID",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "1360060",
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                            color: ThemeColors.textColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 110,
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "SUBJECT",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 210,
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Larem ipsum chokar sitam consecotive adipisieng elit sed do temper inciddunt ut.",
                            style: AppTextStyle.textStyleUtils400(
                              size: 15,
                              color: ThemeColors.textColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "Order #",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "000001",
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                            color: ThemeColors.textColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            "Request Type",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Technical Issue",
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                            color: ThemeColors.textColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 112,
                          child: Text(
                            "Latest Update",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Mar 29, 2021 7;33;13 am",
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                            color: ThemeColors.textColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // height: 25,
                          width: 110,
                          child: Text(
                            "Status",
                            style: AppTextStyle.textStyleUtils400_16(
                              color: ThemeColors.textColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Open",
                          style: AppTextStyle.textStyleUtils400(
                            size: 15,
                            color: ThemeColors.textColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
        //  ],
        //  ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }
}
