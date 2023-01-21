import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meta_package/meta_package.dart';

import 'package:veralusso/app/controller/teams_condition/terms_condition_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:veralusso/app/presentation/common_widget/common_widget/common_appbar.dart';
import 'package:veralusso/app/theme/app_text_style.dart';

class TeamsConditionScreen extends GetView<TeamsConditionController> {
  const TeamsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamsConditionController controller = Get.find<TeamsConditionController>();
    controller.update();

    return Obx(() => Scaffold(
          appBar: commonAppbar(title: LanguageConstants.termsConditionsText.tr),
          drawer: const Drawer(),
          body: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: SpinKitThreeBounce(
                          color: Colors.black,
                        ),
                      )
                    : controller.nodata.value
                        ? Center(
                            child: Text(controller.messageData.value),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ListView.separated(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: Colors.transparent,
                                    height: 0,
                                    thickness: 1.2,
                                  );
                                },
                                itemCount: controller
                                        .teamsConditionList?.cmsText?.length ??
                                    0,
                                itemBuilder: (BuildContext context, int index) {
                                  final teamsCondition = controller
                                      .teamsConditionList?.cmsText?[index];
                                  return ListTileTheme(
                                    contentPadding: const EdgeInsets.all(0),
                                    dense: true,
                                    horizontalTitleGap: 0.0,
                                    minLeadingWidth: 0,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                          dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        iconColor: Colors.black,
                                        collapsedIconColor: Colors.black,
                                        onExpansionChanged: (value) {
                                          controller.collepnseIcon[index] =
                                              value;
                                          debugPrint("value Is $value");
                                        },
                                        childrenPadding: EdgeInsets.zero,
                                        tilePadding: EdgeInsets.zero,
                                        title: Text(
                                          '${teamsCondition?.title}',
                                          style: AppTextStyle.textStyleUtils400_16(),
                                        ),
                                        trailing:
                                            controller.collepnseIcon[index]
                                                ? const Icon(Icons.remove)
                                                : const Icon(Icons.add),
                                        children: [
                                          teamsCondition?.description == null
                                              ? Container()
                                              : Html(
                                                  data: teamsCondition
                                                      ?.description)
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
              ),
            ],
          ),
        ));
  }
}
